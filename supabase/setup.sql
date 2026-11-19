-- =====================================================================
--  Gasthof Ratz Planer – Einrichtung der Datenbank in Supabase
--  Einmalig im Supabase-Dashboard unter "SQL Editor" einfügen und "Run".
--  Das Skript kann gefahrlos mehrmals ausgeführt werden.
--
--  Rollen:
--   * Admins  – melden sich mit E-Mail + Passwort an, dürfen alles ändern.
--               Wer Admin ist, steht in der Tabelle public.admins.
--   * Leser   – öffnen den Lese-Link und geben das gemeinsame Lese-Passwort ein.
--               Sie bekommen die Daten nur über die Funktion lese_daten(),
--               ohne Telefonnummern und ohne Abwesenheitsgründe außer Urlaub.
-- =====================================================================

create extension if not exists pgcrypto with schema extensions;

-- Ein einziger Datensatz mit dem kompletten Planer-Stand (wie das Backup)
create table if not exists public.planer (
  id          int primary key default 1 check (id = 1),
  data        jsonb,
  version     int not null default 0,
  updated_at  timestamptz not null default now(),
  updated_by  text
);
insert into public.planer (id) values (1) on conflict (id) do nothing;

-- Wer darf bearbeiten?
create table if not exists public.admins (
  email text primary key check (email = lower(email))
);

-- Gemeinsames Lese-Passwort (nur als Hash gespeichert)
create table if not exists public.einstellungen (
  id       int primary key default 1 check (id = 1),
  lese_pw  text
);
insert into public.einstellungen (id) values (1) on conflict (id) do nothing;

alter table public.planer        enable row level security;
alter table public.admins        enable row level security;
alter table public.einstellungen enable row level security;

-- Ist der angemeldete Benutzer Admin?
create or replace function public.ist_admin() returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.admins where email = lower(coalesce(auth.jwt() ->> 'email', '')));
$$;

-- Zugriffsregeln: nur Admins lesen/ändern den Planer und die Admin-Liste.
-- Für "einstellungen" gibt es absichtlich keine Regel: niemand liest sie direkt.
drop policy if exists "Admins lesen Planer"   on public.planer;
drop policy if exists "Admins ändern Planer"  on public.planer;
drop policy if exists "Admins lesen Admins"   on public.admins;
drop policy if exists "Admins pflegen Admins" on public.admins;
create policy "Admins lesen Planer"   on public.planer for select to authenticated using (public.ist_admin());
create policy "Admins ändern Planer"  on public.planer for update to authenticated using (public.ist_admin()) with check (public.ist_admin());
create policy "Admins lesen Admins"   on public.admins for select to authenticated using (public.ist_admin());
create policy "Admins pflegen Admins" on public.admins for all    to authenticated using (public.ist_admin()) with check (public.ist_admin());

-- Leser: Daten mit dem gemeinsamen Passwort abrufen (ohne Telefonnummern, Krankheitsgründe usw.)
create or replace function public.lese_daten(pw text) returns jsonb
language plpgsql security definer set search_path = public, extensions as $$
declare h text; d jsonb; v int;
begin
  select lese_pw into h from public.einstellungen where id = 1;
  if h is null or pw is null or crypt(pw, h) <> h then
    perform pg_sleep(1);  -- bremst Durchprobieren
    raise exception 'Falsches Lese-Passwort' using errcode = '28P01';
  end if;
  select p.data, p.version into d, v from public.planer p where p.id = 1;
  if d is null then return jsonb_build_object('data', null, 'version', v); end if;
  d := jsonb_set(d, '{staff}', coalesce((select jsonb_agg(s - 'tel') from jsonb_array_elements(d -> 'staff') s), '[]'::jsonb));
  d := jsonb_set(d, '{absences}', coalesce((select jsonb_agg(case when a ->> 'typ' = 'Urlaub' then a else jsonb_set(a, '{typ}', '"Frei"') end)
                                            from jsonb_array_elements(d -> 'absences') a), '[]'::jsonb));
  return jsonb_build_object('data', d - 'meta', 'version', v);
end $$;

-- Admins: Lese-Passwort setzen/ändern
create or replace function public.setze_lese_pw(pw text) returns void
language plpgsql security definer set search_path = public, extensions as $$
begin
  if not public.ist_admin() then raise exception 'Nur Admins dürfen das Lese-Passwort ändern'; end if;
  if pw is null or length(pw) < 8 then raise exception 'Das Lese-Passwort braucht mindestens 8 Zeichen'; end if;
  update public.einstellungen set lese_pw = crypt(pw, gen_salt('bf')) where id = 1;
end $$;

-- Admins: ist schon ein Lese-Passwort gesetzt?
create or replace function public.lese_pw_gesetzt() returns boolean
language sql stable security definer set search_path = public as $$
  select public.ist_admin() and exists (select 1 from public.einstellungen where id = 1 and lese_pw is not null);
$$;

-- Tabellenrechte für angemeldete Benutzer (neuere Supabase-Projekte vergeben sie nicht mehr automatisch).
-- Wer was sehen/ändern darf, entscheiden trotzdem die Zugriffsregeln oben (nur Admins).
grant select, update on public.planer to authenticated;
grant select, insert, delete on public.admins to authenticated;
revoke all on public.planer, public.admins, public.einstellungen from anon;

revoke all on function public.lese_daten(text)    from public;
revoke all on function public.setze_lese_pw(text) from public;
revoke all on function public.lese_pw_gesetzt()   from public;
revoke all on function public.ist_admin()         from public;
grant execute on function public.lese_daten(text)    to anon, authenticated;
grant execute on function public.setze_lese_pw(text) to authenticated;
grant execute on function public.lese_pw_gesetzt()   to authenticated;
grant execute on function public.ist_admin()         to authenticated;

-- ---------------------------------------------------------------------
--  Die beiden Admins eintragen: E-Mail-Adressen anpassen (klein geschrieben)!
--  Die Benutzer selbst legst du unter Authentication → Users → "Add user" an
--  (E-Mail + Passwort, "Auto Confirm User" anhaken).
-- ---------------------------------------------------------------------
-- insert into public.admins (email) values ('chefkellner@beispiel.at'), ('du@beispiel.at') on conflict do nothing;
