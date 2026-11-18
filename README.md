# Gasthof Ratz – Planer

Eine Planungshilfe für den Chef-Kellner vom Gasthof Ratz. Das Tool ist eine einzige Datei (`index.html`).
Es läuft im Browser am Handy oder PC und braucht weder Server noch Installation.

## Wofür

Für die Fragen, die sich jede Woche stellen:

- **Wie viele Gäste kommen am Freitag zu Mittag oder am Abend?** Reservierte Gäste plus eine eigene Schätzung für Gäste ohne Reservierung.
- **Welche Räume machen wir auf?** Gaststube, Stüberl, Saal und Gastgarten lassen sich pro Tag und Dienst per Tipp auf- oder zusperren.
  Wenn jemand in einem gesperrten Raum reserviert hat, weist das Tool darauf hin.
- **Reicht das Personal?** Es vergleicht die Eingeteilten mit einer einfachen Faustregel, z. B. 1 Kellner je 25 Gäste.
  Fehlt jemand, zeigt **„Wer hat Zeit?“** die freien Leute an, Springer zuerst. Von dort lassen sie sich anrufen, per WhatsApp anfragen oder gleich einteilen.

## Bereiche

- **Übersicht:** die Woche mit Mittag und Abend pro Tag, jeweils mit Gästen, Räumen und Personal.
- **Dienstplan:** ein Wochenraster. Ein Tipp ins Feld trägt eine Schicht aus einer Vorlage ein. Wochen lassen sich übernehmen, und jeder Schritt kann rückgängig gemacht werden.
- **Gäste:** Reservierungen mit Name, Personen, Datum, Uhrzeit und Raum.
- **Personal:** Name, Abteilung, Fix oder Springer, Telefon. Dazu Urlaub und Abwesenheiten.
- **Reports:** Wochenvorschau, Dienstplan (für alle oder eine Person), Reservierungen und Öffnungszeiten.
  Ausgabe als PDF (über Drucken), per WhatsApp, über Teilen oder als kopierter Text.
- **Betrieb:** pro Wochentag Mittag und/oder Abend offen, Sondertage und Betriebsurlaub, österreichische Feiertage, Räume, Abteilungen mit Faustregel, Schichtvorlagen und Backup.

## Daten & Backup

Alle Daten liegen **nur im Browser des Geräts**. Daher gilt:

1. Etwa einmal pro Woche unter **Betrieb → Backup** ein Backup herunterladen oder per „Teilen“ an sich selbst schicken.
   Der Knopf „Backup“ oben rechts wird orange, wenn es Zeit dafür ist.
2. Zum Wiederherstellen, auch auf einem neuen Handy, die Option **Backup-Datei einspielen…** wählen.
   Vorher wird der aktuelle Stand automatisch gesichert.

Zusätzlich legt das Tool einmal täglich eine automatische Sicherung auf dem Gerät an.

## Am Handy nutzen

Am besten über eine feste Adresse, zum Beispiel GitHub Pages: Im Repo unter Settings → Pages den Branch `main` mit dem Ordner `/ (root)` wählen.
Danach die Seite am Handy öffnen und mit „Zum Home-Bildschirm“ wie eine App ablegen.
