# Gasthof Ratz – Planer

Eine Planungshilfe für den Chef-Kellner vom Gasthof Ratz. Das Tool ist eine einzige Datei (`index.html`).
Es läuft im Browser am Handy oder PC und braucht weder Server noch Installation.

## Wofür

Für die Fragen, die sich jede Woche stellen:

- **Wie viele Gäste kommen am Freitag zu Mittag oder am Abend?** Reservierte Gäste plus eine eigene Schätzung für Gäste ohne Reservierung.
- **Welche Räume machen wir auf?** Gaststube, Stüberl, Saal und Gastgarten lassen sich pro Tag und Dienst per Tipp auf- oder zusperren.
  Wenn jemand in einem gesperrten Raum reserviert hat, weist das Tool darauf hin.
- **Reicht das Personal?** Für Service und Küche berechnet das Tool den Bedarf automatisch aus Gästezahl **und Ankunftszeiten**.
  25 Gäste im Halbstundentakt schafft eine Person, kommen sie gleichzeitig, braucht es zwei (Details in [BACKLOG.md](BACKLOG.md) unter „Umgesetzt“).
  Fehlt jemand, zeigt **„Personal zuteilen“** die freien Leute an, Springer zuerst. Von dort lassen sie sich anrufen, per WhatsApp anfragen oder gleich einteilen.

## Bereiche

- **Übersicht:** die Woche mit Mittag und Abend pro Tag, jeweils mit Gästen, Räumen und Personal.
- **Dienstplan:** ein Wochenraster. Ein Tipp ins Feld trägt eine Schicht aus einer Vorlage ein. Wochen lassen sich übernehmen, und jeder Schritt kann rückgängig gemacht werden.
- **Gäste:** Reservierungen mit Name, Personen, Datum, Uhrzeit und Raum.
- **Personal:** Name, Abteilung, Fix oder Springer, Telefon. Dazu Urlaub und Abwesenheiten.
- **Reports:** Wochenvorschau, Dienstplan (für alle oder eine Person), Reservierungen und Öffnungszeiten.
  Ausgabe als PDF (über Drucken), per WhatsApp oder als kopierter Text.
- **Betrieb:** Wochenplan Mittag/Abend mit Saisonen (z. B. Winter, Sommer; gelten jedes Jahr), Sondertage und Betriebsurlaub, österreichische Feiertage, Räume, Abteilungen, Schichtvorlagen und Backup.

## Gemeinsam nutzen (optional)

Mit einer kostenlosen Supabase-Datenbank arbeiten **zwei Admins am selben Stand**, und das Team sieht Übersicht,
Dienstplan und Reservierungen über einen **Lese-Link mit gemeinsamem Passwort** (nur ansehen, ohne Telefonnummern).
Einrichtung: siehe [supabase/ANLEITUNG.md](supabase/ANLEITUNG.md). Solange in `index.html` bei `CLOUD` nichts eingetragen ist,
bleibt alles wie bisher nur auf dem Gerät.

## Datenschutz (DSGVO)

- **Datensparsam:** Beim Personal werden nur Vorname, Abteilung und Fix/Springer gespeichert, keine Telefonnummern.
  Bei Reservierungen nur Name (Vorname oder Gruppe), Personen, Datum, Uhrzeit, Raum und Kommentar.
- **Keine Gesundheitsdaten:** Bei Abwesenheiten gibt es nur „Abwesend“, ohne Grund.
  Im Kommentar zu Reservierungen bitte keine Allergien oder Ähnliches eintragen.
- **Speicherbegrenzung:** Reservierungen und Abwesenheiten werden **6 Monate nach dem Termin automatisch gelöscht**.
- **Keine Dritt-Server:** Schriften (`fonts/`) und die Supabase-Bibliothek (`vendor/`) liegen im Repo.
  Beim Öffnen werden keine Daten an Google oder CDNs übertragen. Verbindungen gibt es nur zu GitHub Pages (Auslieferung) und Supabase (EU, Frankfurt).
- **Zu erledigen durch den Betrieb:** einen Auftragsverarbeitungsvertrag (DPA) mit Supabase abschließen,
  einen Eintrag im Verzeichnis der Verarbeitungstätigkeiten anlegen und die Datenschutzerklärung auf ratz.at ergänzen.

Lizenzen: Playfair Display und Source Sans 3 stehen unter der SIL Open Font License (`fonts/OFL-*.txt`), supabase-js unter MIT (`vendor/LICENSE-supabase-js.txt`).

## Daten & Backup

Alle Daten liegen **nur im Browser des Geräts**. Daher gilt:

1. Etwa einmal pro Woche unter **Betrieb → Backup** auf **„Backup sichern“** tippen. Am Handy öffnet sich das Teilen-Menü,
   z. B. für „In Drive speichern“ oder eine Mail an dich selbst. Am PC landet die Datei in „Downloads“.
   Oben in der Kopfzeile erscheint **„Backup fällig“**, wenn es wieder Zeit ist.
2. Zum Wiederherstellen, auch auf einem neuen Handy, **„Backup einspielen…“** wählen und die Datei auswählen.
   Vorher wird der aktuelle Stand automatisch gesichert.

Zusätzlich legt das Tool einmal täglich eine automatische Sicherung auf dem Gerät an.

## Am Handy nutzen

Am besten über eine feste Adresse, zum Beispiel GitHub Pages: Im Repo unter Settings → Pages den Branch `main` mit dem Ordner `/ (root)` wählen.
Danach die Seite am Handy öffnen und mit „Zum Home-Bildschirm“ wie eine App ablegen.

## Ideen & offene Punkte

Siehe [BACKLOG.md](BACKLOG.md).
