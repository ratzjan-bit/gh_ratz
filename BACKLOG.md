# Backlog – Änderungsideen

Sammlung von Ideen und offenen Punkten für den Planer. Erledigtes steht unten unter „Umgesetzt“.
Neue Ideen einfach unten anfügen.

## Personalbedarf

### Regelmäßig „keine Küche“
Heute kann man eine Abteilung pro Tag und Dienst per Tipp auf „nicht nötig“ setzen. Ist das eine feste Regel, z. B. mittags unter der Woche oder im ganzen Winter, sollte man es im Wochenplan bzw. in der Saison hinterlegen können.

## Räume

### Räume an Saisonen koppeln
Räume haben heute einen eigenen Saisonzeitraum, z. B. Gastgarten 1. Juni – 30. September. Alternativ könnte ein Raum einfach eine der Öffnungs-Saisonen auswählen, z. B. „Sommer“, damit man Zeiträume nicht doppelt pflegt.

## Technik

### Downloads in der Artifact-Testversion
Im Artifact sind Datei-Downloads und Drucken gesperrt, deshalb läuft das Backup dort als Text. Über die Download-Funktion der Artifact-Plattform könnte das Backup auch dort als Datei gespeichert werden. Für die Handy-Version ist das nicht nötig.

### Offline starten (GitHub Pages)
Über GitHub Pages lädt der Browser die Seite aus dem Netz. Meist hält er sie im Zwischenspeicher, garantiert ist das aber nicht.
Mit einem kleinen Service Worker und einem Web-App-Manifest startet der Planer auch ohne Empfang und lässt sich sauber als App auf den Home-Bildschirm legen (eigenes Symbol, ohne Browserleiste).

### Supabase mit dem GitHub-Repo verbinden
Vorerst bewusst nicht. Supabase würde dann SQL-Dateien aus `supabase/migrations` bei jedem Push automatisch in die Live-Datenbank einspielen.
Sinnvoll erst, wenn mehrere Leute am Code arbeiten oder sich die Datenbank-Struktur öfter ändert, z. B. eigene Tabellen pro Reservierung
statt eines Gesamt-Datensatzes. Dann das Repo auf die Ordnerstruktur der Supabase-Werkzeuge umstellen (`config.toml`, `migrations/`).

## Umgesetzt

### Personalbedarf nach Ankunftsspitzen
*Eingebracht: 18.11.2026 · umgesetzt: 19.11.2026*

Die Regel ist fest im Hintergrund hinterlegt (`BEDARF` und `FENSTER` in `index.html`) und hat keine Einstellungen.

| Abteilung | 1 Person je … Gäste im ganzen Dienst | 1 Person je … Gäste, die innerhalb von 30 Min. ankommen |
|---|---|---|
| Service | 40 | 15 |
| Küche | 50 | 25 |

- Bedarf = der höhere der beiden Werte, mindestens 1, sobald Gäste kommen.
- Geschätzte Laufkundschaft verteilt sich, ein Viertel davon zählt zur Spitze.
- Beispiel Service: 25 Gäste im Halbstundentakt ergeben 1 Person, 25 Gäste gleichzeitig ergeben 2.
- Gibt die Spitze den Ausschlag, steht die Begründung in der Übersicht, z. B. „Ankunftsspitze 18:30–19:00: 41 Gäste“.
- Die Werte werden mit der Praxis nachjustiert. Abteilungen außer Service und Küche werden nicht berechnet.

### Gemeinsame Datenbank mit Admins und Lese-Link
*Umgesetzt: 19.11.2026*

Supabase (EU) als gemeinsamer Speicher. Admins melden sich mit E-Mail und Passwort an, das Team liest über einen Lese-Link mit gemeinsamem Passwort.
Die Rechte prüft die Datenbank (Row Level Security, `supabase/setup.sql`). Leser bekommen keine Telefonnummern und keine
Krankheitsgründe. Gleichzeitiges Speichern zweier Admins wird erkannt, der nicht gespeicherte Stand bleibt als automatische Sicherung erhalten.

