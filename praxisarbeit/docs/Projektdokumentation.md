# Projekt Dokumentation

[[_TOC_]]

## Lösungsdesign
Anhand der Analyse wurde folgendes Lösungsdesign entworfen.

### Aufruf der Skripte

TODO: schreiben sie wie die Skripte aufgerufen werden sollen (d.h. welche Parameter werden übergeben, gibt es Interaktionen mit dem Skript, läuft es automatisch täglich ab?)

Werden von User aufgerufen: 

./createUser.sh --inputFile xyz.txt --password "MySecurePassword" --createGroup

./createCronBackup --amountOfBackups n --command xyz

Programm ruft selber auf:

./backup.sh --config someConfig.yml -o dir/dir/outputFileName --groupName xyz --excludeList exclude.yml

### Ablauf der Automation

[activityDiagram.pdf](https://github.com/BenjaminJacober/tbzm122/files/8740801/activityDiagram.pdf)

### Konfigurationsdateien



## Abgrenzungen zum Lösungsdesign

TODO: Nachdem das Programm verwirklicht wurde, hier die Unterschiede von der Implementation zum Lösungsdesign beschreiben (was wurde anders gemacht, was wurde nicht gemacht, was wurde zusaetzlich gemacht)
