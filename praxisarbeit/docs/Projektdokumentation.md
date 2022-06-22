# Projekt Dokumentation

[[_TOC_]]

## Lösungsdesign

[activityDiagram.pdf](https://github.com/BenjaminJacober/tbzm122/files/8740801/activityDiagram.pdf)

### Aufruf der Skripte

Werden von User aufgerufen: 

./createUser.sh -i xyz.txt -p "MySecurePassword" -c

./createCronBackup -c command

Cronjob ruft selber auf:

./backup.sh -a amountOfBackups -o dir/dir/outputFileName -g groupName -e excludeList

### Ablauf der Automation

[activityDiagram.pdf](https://github.com/BenjaminJacober/tbzm122/files/8740801/activityDiagram.pdf)

### Konfigurationsdateien

userInputFile.txt und createCronJob.conf in ./etc

## Abgrenzungen zum Lösungsdesign

Einige Sachen haben wir nicht gemacht, andere schon.
