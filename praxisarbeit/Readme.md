# Praxisarbeit LB1

[[_TOC_]]

In einer Firma möchte man ganz einfach neue Mitarbeiter auf einem System erfassen können. Dazu möchte der Unix-Verantwortliche ein Skript haben, welches aufgrund eines Files neue User erfasst und deren Unix-Umgebung (Home-Directory) einrichtet. Er möchte auch ein Backupskript, welches die Home-Directories der User sichert.

## Auftrag
Erstellen sie 2 Skripte die folgende Aufgaben erfüllen

### Skript 1 
Skript zum automatischen erstellen von Unix-Usern und zum default passwort setzen, welches beim ersten login geändert werden muss. Es sollen nur nicht existierende User erstellt werden. Es soll User-Home-Verzeichnisse mit Skeleton-Template-Umgebung einrichten. Es sollen keine existierenden Dateien überschrieben werden.
#### Muss-Kritierien
* Es soll anhand von einem Input file in welchem folgende Angaben der zu erstellenden User erfasst sind User erstellen: 
```
<username> <groupname> <vorname nachname>
```

* Es soll überprüfen ob die Gruppe eine der Gruppen ist, die im Skript 2 auch gesichert werden. Ansonsten soll eine Warnung ausgegeben werden, dass das User-Home nicht gesichert wird.
* Es soll prüfen, ob die Gruppe mit dem `<groupname>` existiert, falls nicht eine Warnung ausgeben und nichts tun.
* Es soll ein konfigurierbares default passwort setzen, welches beim ersten login geändert werden muss.
* Es soll je nach Gruppe anhand einer Gruppenspezifischen Skeleton-Template-Umgebung das User-Home-Verzeichnis einrichten.
* Es soll eine Warnung ausgeben, falls der User schon existiert und nichts weiter tun.

#### Kann-Kriterien
* Es soll eine neue Gruppe anlegen falls die Gruppe noch nicht existiert.
* Falls der User existiert und das User-Home-Verzeichnis nicht, soll es mit der richtigen Skeleton-Template-Umgebung erstellt werden.
* Es soll ein Logfile mit einem einheitlichen Format geschrieben werden.
* ...

### Skript 2 
Backup von allen User-Homes welche bestimmten Gruppen zugeordnet sind. Es sollen nur eine gewisse Anzahl von Backups behalten werden und das Backup Skript soll per Cronjob täglich ausgeführt werden. Es soll das Backup aller User-Homes in einem tar-archive mit einem konfigurierbaren Namen an einem konfigurierbaren Ort speichern.

#### Muss-Kriterien
* Die Gruppen für welche User-Home-Verzeichnisse gesichert werden sollen, müssen in einen Konfig-File gespeichert sein. Das Format des Files:

	```
	<groupname1>
	<groupname2>
	...
	```
* Es soll überprüft werden ob die zu sicherende Gruppe existiert. Ansonsten soll eine Warnung ausgegeben werden.
* Es soll frei konfigurierbar sein, wieviele Backups aufbewahrt werden sollen.
* Es soll frei konfigurierbar sein, in welchem Verzeichnis die Backups gespeichert werden sollen.
* Es soll frei konfigurierbar sein, wie die Backup files heissen sollen, d.h. das Prefix des Filenamens soll frei wählbar sein.
* Es soll nur ein tar-Archive pro Backup von allen User-Home-Verzeichnissen zusammen erstellt werden. (D.h. alle User-Home-Verzeichnisse in einem tar file)

#### Kann-Kriterien
* Es soll möglich sein in jedem User-Home-Verzeichnis, gewisse Verzeichnisse mit samt Inhalt von der Sicherung auszunehmen, d.h. nicht zu sicheren. 
* Es soll ein Logfile mit einem einheitlichen Format geschrieben werden.
* ...


## Vorgehen

| Task | Beschreibung | Modus | zu bearbeitende Dokumente |
| - | - | - | - |
| Definition von User Interface | Definieren sie welche Argumente sie den Skripte übergeben werden und dokumentieren sie dies. | Teamarbeit | [Projektdokumenation](docs/Projektdokumentation.md) |
| Activity Diagramm | Zeichnen sie für die beiden Skripts Activity-Diagramme | Teamarbeit |[Projektdokumenation](docs/Projektdokumentation.md) |
| Definition von Konfigurationdateien | Definieren sie Konfigurationsdateien die beide Skripte benutzen sollen und dokumentieren sie diese. Definieren soweit bekannt die Konfigurationsparameter. Erstellen sie erste Sample-Konfigfiles. | Teamarbeit | [Projektdokumenation](docs/Projektdokumentation.md)<br>[Verzeichnes für Konfigfiles](etc) |
| Implementieren | Schreiben sie je eines der beiden Skript. Passen sie die Sample-Konfiguration Files an falls nötig | Einzelarbeit | [Verzeichnis für Skripts](bin)<br>[Verzeichnes für Konfigfiles](etc)|
| Installationsanleitung | Machen sie eine Anleitung für den Administrator (Installation und Konfiguration des Skripts), d.h. alles was initial einmal gemacht werden muss | Einzelarbeit | [Betriebsdokumenation](docs/Betriebsdokumentation.md) |
| Anwendungsanleitung | Machen sie eine Anleitung für den Administrator oder Benutzer des Skripts mit den wiederkehrenden Tasks | Einzelarbeit | [Betriebsdokumenation](docs/Betriebsdokumentation.md) |



