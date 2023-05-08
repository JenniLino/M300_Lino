# Vagrant als Webserver
Es erfolgt eine Durchführung der Ubuntu-Server-Installation. einschließlich einer automatischen Installation des Apache-Webservers. Des Weiteren wird eine Synchronisierung des Verzeichnisses "/var/www/html" auf der virtuellen Maschine mit dem lokalen Verzeichnis "html" vorgenommen.

## Automatischer Webserver
Im "Vagrantfile" können Bash-Befehle oder Skripte hinterlegt werden, um die automatische Installation des Webservers zu ermöglichen. Ich habe es mit einem Script gemacht.
```
config.vm.provision "shell", path: "./script/script.sh"

```

## script
Das Skript, das hinterlegt wurde, führt die nachfolgenden Befehle aus:
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y apache2
sudo apt-get install -y ufw
sudo apt-get install -y libapache2-mod-proxy-html
sudo apt-get install -y libxml2-dev

sudo ufw --force enable
sudo ufw allow 80/tcp
sudo ufw allow 22
sudo ufw allow from [192.168.33.10] to any port 22

sudo a2enmod proxy
sudo a2enmod proxy_html
sudo a2enmod proxy_http

```
Die apt-get Befehle machen, dass die virtuelle Maschine auf dem neuesten Stand ist. Anschließend werden der Apache Webserver, die UFW Firewall und der Reverse Proxy installiert.

Die ufw Befehle, aktiviert die Firewall und dann machen noch ein paar ausnahmen.

DDie a2enmod Befehle dienen der Installation von Modulen für den Apache Webserver. In diesem Fall wird der Reverse Proxy installiert.

## Einen lokalen Ordner mit einem Ordner in der VM verknüpfen.
Um einen lokalen Ordner mit der virtuellen Maschine zu teilen, müssen folgende Angaben im Vagrantfile gemacht werden:
```
config.vm.synced_folder "./html", "/var/www/html"
```

## Geben Sie den Zugriff von einem Webbr
Um nun auch auf den Webserver zugreifen zu können muss ein Port vom lokalen PC auf die VM weitergeleitet werden. 
Dafür muss man folgendes im Vagrantfile angeben.

```
config.vm.network "forwarded_port", guest:80, host:420, auto_correct: true
```
Dies bedeutet, dass der lokale Port "420" weitergeleitet wird auf Port "80" in der VM.


# Vagrant als Webserver

Um die VM vorab zu konfigurieren, kann man einfach das Vagrantfile bearbeiten.