# LevelUP
Leistungsbewertung in der Schule - XP basiert (OSZIMT)
## Starte die Applikation und die Datenbank für Development Mode
1. Ändere in der Datei app.js in Zeile 12 den host zu localhost.
2. Starte die Sql Datenbank mit dem docker Befehlt `docker start levelup-database`
3. Springe in das Verzeichnis `LevelUp/build/app`
4. Führe den Befehl `npm install` aus, damit holst du dir alle nötigen node modules die unter package.json hinterlegt sind. **Wichtig:** `npm install` im /app Verzeichnis ausführen.
5. Im /app Verzeichnis `node ./src/app.js` ausführen um den Webserver zu starten.

## Baue und starte die Applikation und Datenbank als gesamtes

**Hinweis:** Diese Art und Weise beide Container zu bauen, eigent sich für das testen der User Interface Ebene. Änderungen die am Code auf der Applikationsebene gemacht werden sind nicht sichtbar, dafür eignet sich die Development Mode Angehensweise.

1. Führe folgenden Befehl aus, um die Applikation Lokal zum laufen zu bekommen: `docker compose up --build` im Projektverzeichnis.
2. Die Applikation ist unter `localhost:3333` erreichbar.
## Was wird benötigt:
-	Website mit einem Levelsystem (max. LVL 50 pro Lernfeld).
-	Levelanforderungen statisch.
-	XP bei Abschluss von Lerninhalten (Bonus EXP bei guten Leistungen).
-	Lootboxen (Abhängig von Zensuren, Level und Anwesenheit).
-	Benutzerdatenbank
-	Highscore board.
## Wireframe der Webanwendung:
[LevelUP.pdf](https://github.com/Brianquant/LevelUP/files/13348480/LevelUP.pdf)

## Action & ItemList
[ActionList.pdf](https://github.com/Brianquant/LevelUP/files/13873227/ActionList.pdf)<br>
[ItemList.pdf](https://github.com/Brianquant/LevelUP/files/13873233/ItemList.pdf)

## Auswahl der Technologie:
-	Frontend: HTML, CSS, Vanilla JS
-	Datenbank: MySQL
-	Webserver: Apache
-	Backend: NodeJS
-	Hosten auf github pages
-	CI/CD über GitHub mit Docker

## Datenbank ER-Modell:
![DatenbankPlanung](https://github.com/Brianquant/LevelUP/assets/91448422/ea0b1703-6e82-43a7-9de6-c02ab1675abe)


