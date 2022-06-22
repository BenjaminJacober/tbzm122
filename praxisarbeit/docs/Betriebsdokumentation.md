# Betriebsdokumentation
[[_TOC_]]
## Einführungstext 

In einer Firma möchte man ganz einfach neue Mitarbeiter auf einem System erfassen können. Dazu möchte der Unix-Verantwortliche ein Skript haben welches aufgrund des Inhalts einer Datei neue User erfasst und deren Unix-Umgebung (Home-Directory) einrichtet und ein Backup-Skript welches die Home-Directories der User sichert.
## Installationsanleitung für Administratoren

### Installation

git clone our repo

### Konfiguration

Konfigurationsfiles editieren, siehe example files in ./etc

So in etwa:
./createCronJob.sh -c "./backup.sh -a 5"

Es können keine User Templates eingerichtet werden, da wir das nicht gemacht haben.
