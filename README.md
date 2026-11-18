# Gasthof Ratz – Dienstplan & Reservierungen

Ein Planungstool für den Gasthof Ratz als einzelne Datei (`index.html`). Es läuft
in jedem aktuellen Browser auf Handy, Tablet oder PC und braucht weder Server noch Installation.

## Funktionen

- **Personal:** Kellner, Küche, Schank, Spüle und weitere Abteilungen frei anlegbar.
  Pro Person: Position, Beschäftigung, Soll-Stunden, Telefon und die Wochentage, an denen sie nicht verfügbar ist.
- **Abwesenheiten:** Urlaub, Krank, Frei-Wunsch und Berufsschule.
- **Dienstplan:** Wochenraster oder Tagesliste. Schichten trägt man per Tipp aus Schichtvorlagen ein,
  geteilte Dienste sind möglich. Eine Woche lässt sich übernehmen, und jeder Schritt kann rückgängig gemacht werden.
- **Prüfungen:** Überschneidungen, Einsatz trotz Urlaub oder Krankheit, Ruhezeit, maximale Tagesarbeitszeit,
  Verfügbarkeit und unbesetzte Abteilungen.
- **Öffnungszeiten:** Ruhetage, zwei Zeitfenster pro Tag und „Küche bis“.
  Dazu Sondertage und Betriebsurlaub sowie Feiertage (BW, BY, DE, AT) mit einer Regel für Feiertage.
- **Reservierungen:** Datum, Zeit, Personen, Raum und Tisch, Anlass, Status und Notizen.
  Das Tool warnt, wenn geschlossen ist, die Zeit außerhalb der Öffnungszeiten liegt oder ein Raum überbucht ist.
- **Reports:** Dienstplan für das Team oder eine einzelne Person, Reservierungen, Stundenübersicht und Öffnungszeiten.
  Zeitraum wählbar: diese oder nächste Woche, dieser oder nächster Monat oder ein eigener Zeitraum.
  Ausgabe über Drucken/PDF, Teilen, WhatsApp, E-Mail, Excel (CSV), Kalenderdatei (.ics) und HTML-Datei.
- **Backup:** JSON-Datei herunterladen oder teilen, als Text kopieren und wieder einspielen.
  Zusätzlich legt das Tool täglich automatisch eine Sicherung auf dem Gerät an.

## Daten & Backups

Alle Daten liegen **nur im Browser des jeweiligen Geräts** (localStorage). Deshalb gilt:

1. Regelmäßig (am besten wöchentlich) unter **Betrieb → Daten & Backup** ein Backup herunterladen
   oder per „Teilen“ in die Cloud bzw. per E-Mail an sich selbst schicken.
2. Zum Wiederherstellen auf demselben oder einem neuen Gerät: **Backup-Datei einspielen…**
   Vorher sichert das Tool automatisch den aktuellen Stand.

Der Knopf „Backup“ oben rechts wird orange, wenn seit über 7 Tagen kein Backup gemacht wurde, sich aber etwas geändert hat.

## Auf dem Handy nutzen

Am zuverlässigsten ist eine feste Web-Adresse, zum Beispiel über GitHub Pages dieses Repos.
Die Seite öffnest du im Browser und legst sie mit „Zum Home-Bildschirm“ wie eine App ab.
Die Daten bleiben trotzdem nur auf dem Handy.

Alternativ kannst du `index.html` direkt auf das Handy kopieren und mit Chrome oder Firefox öffnen.
Auf dem iPhone funktioniert das aus der Dateien-App heraus nicht zuverlässig. Dort ist eine Web-Adresse die richtige Wahl.
