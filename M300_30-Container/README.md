Apache Server
===

Beim ausführen dieses Dockerfile wird ein Container erstellt, der einen Apache-Webserver und eine HTML-Seite bereitstellt. Der Benutzer kann auf diese Anwendung über einen Webbrowser zugreifen und die HTML-Seite mit der Nachricht "Das ist ein Test" anzeigen lassen.

### **Dockerfile**
Dieses Dockerfile baut ein Image auf Basis des neuesten Ubuntu-Images auf. Es installiert den Apache-Webserver und das curl-Programm, aktualisiert die Konfigurationsdatei des Apache-Servers und kopiert die index.html-Datei in das Verzeichnis /var/www/html. Der Container wird auf Port 8081 freigegeben und der Befehl zum Starten des Apache-Servers wird definiert.

### **apache.conf**

Die Datei apache.conf enthält Konfigurationseinstellungen für den Apache Webserver, welche grundlegende Einstellungen festlegen. Hier wird der Servername auf "localhost" festgelegt und das Dokumentenverzeichnis auf "/var/www/html". Zudem werden die Berechtigungen für das Verzeichnis definiert, sodass der Apache-Server auf die Dateien im Verzeichnis zugreifen und diese bereitstellen kann.

### **index.html**

Das stimmt genau! Die index.html-Datei ist die Standard-Startseite für den Apache-Webserver und wird normalerweise in das Verzeichnis /var/www/html kopiert, damit sie über den Webbrowser aufgerufen werden kann. In diesem Fall enthält die Datei einen einfachen HTML-Code, der den Titel "M300-LB3" und den Text "Das ist ein Test" enthält. Sobald der Apache-Webserver gestartet ist, kann die Seite über die Adresse "localhost:8081" im Webbrowser aufgerufen werden.

Apache HTTP to HTTPS
===

Das vorliegende Dockerfile erzeugt ein Docker-Image mit dem Apache-Webserver, in dem das SSL-Modul und die Basis-Authentifizierung aktiviert sind. Der Apache-Webserver wird im Vordergrund gestartet und die Ports 80 und 443 werden freigegeben.
### **Schritte**

1 Verwende das aktuellste offizielle Ubuntu-Image als Basisimage.
2 Setze den Maintainer auf Apache.
3 Installiere den Apache-Webserver, SSL-Zertifikate und das apache2-utils-Paket.
4 Aktiviere die notwendigen Apache-Module (ssl, rewrite, headers) und die SSL-Standard-Site.
5 Erstelle eine Umleitungsregel, um den eingehenden Datenverkehr von Port 80 auf 443 in einer Konfigurationsdatei weiterzuleiten.
6 Füge die Anweisungen für die Basis-Authentifizierung zur SSL-Konfigurationsdatei hinzu.
7 Setze die erforderlichen Umgebungsvariablen für den Apache-Webserver.
8 Erstelle die benötigten Verzeichnisse für den Apache-Webserver.
9 Erstelle eine .htpasswd-Datei für die Basis-Authentifizierung.
10 Freigebe Ports 80 und 443.
Starte den Apache-Webserver im Vordergrund.

### **Verwendung**
Das erstellte Docker-Image kann verwendet werden, um einen Apache-Webserver mit SSL-Unterstützung und Basis-Authentifizierung in einem Docker-Container bereitzustellen. Die Ports 80 und 443 müssen freigegeben werden, damit der Container von außen erreichbar ist.

Dockerfile MySQL
===

Dieser Dockerfile erstellt ein Image für einen MySQL-Server mit vordefinierten Benutzer- und Datenbankinformationen.

### **Details**
Dieser Dockerfile verwendet das offizielle MySQL-Image von Docker Hub als Basis. Es wird eine Datenbank namens "mydatabase" erstellt und ein Benutzer mit den Anmeldeinformationen "user:123456" angelegt. Der MySQL-Server wird auf Port 3306 freigegeben und automatisch gestartet, wenn der Docker-Container gestartet wird.


Image Bereitstellung
===

Dieses Dockerfile erstellt ein Docker-Image für einen Apache Webserver auf Basis des offiziellen Ubuntu 20.04 Images. Dazu wird zunächst das Ubuntu-Image als Basis verwendet. Anschließend wird der Apache-Webserver installiert und eine Beispiel-Webseite erstellt. Der Port 80 wird für eingehende Verbindungen freigegeben. Zusätzlich wird die Zeitzone auf Europa/Berlin gesetzt.

Das erstellte Image des Apache-Webservers kann entweder innerhalb eines privaten Unternehmens oder auf Docker-Hub hochgeladen werden, um es später auf anderen Systemen oder in der Cloud zu verwenden. Durch das Hochladen in ein privates Unternehmen kann das Image innerhalb des eigenen Netzwerks oder auf eigenen Servern gespeichert und verteilt werden, während das Hochladen auf Docker-Hub das Image für die breite Öffentlichkeit zugänglich macht.

Volumes
===

Volumes in Docker ermöglichen es, Daten zwischen Containern auszutauschen und persistent zu speichern. Sie bieten Datenspeicherung, Persistenz und Flexibilität, um Daten in einem Container-Cluster zu teilen und zu skalieren.

### **MySQL**
Dieses Dockerfile erstellt ein Docker-Image für MySQL mit individuellen Konfigurationen. Es legt Umgebungsvariablen fest, erstellt ein Volume für MySQL-Daten und öffnet den Port 3306 für den Datenverkehr. Mithilfe eines spezifischen Befehls kann getestet werden, ob das Volume erfolgreich erstellt wurde. Das Volume ist im Ordner "Volumes" zu finden.

Testfälle
======
| Testfall                                                  | geschätztes Ergebniss                       | effektives Ergebnis |
| --------------------------------------------------------- | ------------------------------------------- | ------------------- |
| 1. Image erstellen                                        | Image wird erfolgreich erstellt             | korrekt             |
| 2. Container erstellt                                     | Container wird erfolgreich erstellt         | korrekt             |
| 3. Container ist abrufbar                                 | Container konnte abgerufen werden           | korrekt             |
| 4. Reproduzierbarkeit                                     | Container wird genau gleich erstellt        | korrekt             |
| 5. Container kann von jemand anderes auch erstellt werden | bei Silvan genau gleich erstellt            | korrekt             |

[&uarr; nach oben](https://github.com/JenniLino/M300_Lino/tree/main/M300_30-Container)
