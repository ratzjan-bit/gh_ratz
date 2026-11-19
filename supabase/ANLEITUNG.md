# Gemeinsame Datenbank einrichten (Supabase)

Damit arbeiten zwei Admins (Chef-Kellner und Jan) am selben Stand, und das Team sieht Übersicht,
Dienstplan und Reservierungen über einen Lese-Link mit gemeinsamem Passwort. Dauer: ca. 15 Minuten.

## 1. Projekt anlegen
1. Auf [supabase.com](https://supabase.com) ein kostenloses Konto anlegen.
2. **New project** wählen. Name z. B. `gasthof-ratz`, ein Datenbank-Passwort vergeben (gut aufheben, wird im Alltag nicht gebraucht),
   bei **Region** „Central EU (Frankfurt)“ wählen und das Projekt erstellen. Das dauert ein bis zwei Minuten.

## 2. Datenbank einrichten
1. Links **SQL Editor** öffnen, dann **New query**.
2. Den Inhalt von [`setup.sql`](setup.sql) komplett einfügen.
3. Ganz unten die Zeile mit `insert into public.admins …` anpassen: das `--` am Anfang entfernen und die beiden echten
   E-Mail-Adressen eintragen, **klein geschrieben**.
4. **Run** drücken. Es sollte „Success“ erscheinen.

## 3. Admin-Konten anlegen
1. Links **Authentication → Users → Add user → Create new user**.
2. E-Mail (dieselbe wie in Schritt 2) und ein Passwort eingeben, **Auto Confirm User** anhaken und speichern.
3. Für den zweiten Admin wiederholen.

## 4. Zugangsdaten an Claude geben
Unter **Project Settings → API** (bzw. „Data API“) zwei Werte kopieren:
- **Project URL**, z. B. `https://abcdefgh.supabase.co`
- **anon public** Key (ein langer Text, beginnt mit `eyJ…`)

Beide sind dafür gedacht, in der Webseite zu stehen. Die Rechte prüft die Datenbank selbst.
**Den `service_role`-Key nie weitergeben.**

## 5. Erste Anmeldung
1. Die Seite öffnen (GitHub Pages) und mit E-Mail und Passwort anmelden.
2. Daten übernehmen: Entweder erscheint „Diese Daten übernehmen“, wenn auf dem Gerät schon Daten der lokalen Version liegen,
   oder du spielst ein Backup ein, oder du startest leer.
3. Unter **Betrieb → Zugriff** ein **Lese-Passwort** setzen (mindestens 8 Zeichen) und den **Lese-Link** kopieren.
4. Lese-Link und Lese-Passwort ans Team schicken, z. B. per WhatsApp-Gruppe.

## Gut zu wissen
- **Leser** sehen Übersicht, Dienstplan und Reservierungen, ohne Telefonnummern. Statt „Krank“ steht bei ihnen „Frei“.
  Ändern können sie nichts, das prüft die Datenbank.
- **Lese-Passwort ändern:** unter Betrieb → Zugriff. Das alte Passwort gilt danach sofort nicht mehr.
- **Weitere Admins:** unter Betrieb → Zugriff eintragen und zusätzlich in Supabase ein Benutzerkonto anlegen (Schritt 3).
- **Passwort eines Admins vergessen:** in Supabase unter Authentication → Users beim Benutzer neu setzen.
- **Gratis-Tarif:** Wird ein Projekt eine Woche lang gar nicht benutzt, pausiert Supabase es. Ein Klick auf „Restore“ im Dashboard
  weckt es wieder auf. Im Alltag passiert das nicht, weil der Planer laufend benutzt wird.
