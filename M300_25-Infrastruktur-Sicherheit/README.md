M300 - 25 Infrastruktur-Sicherheit
===

VM Vagrantfile - Firewall
===
In diesem Beispiel werden zwei virtuelle Maschinen definiert: "firewall" und "web". Beide virtuellen Maschinen basieren auf Ubuntu "Xenial64".

Die virtuelle Maschine "firewall" hat die IP-Adresse "10.0.0.11" und wird über den Hostnamen "Firewall" identifiziert. Um die Firewall-Konfiguration durchzuführen, wird eine Shell-Provisionierung verwendet, um das ufw-Paket zu installieren. Anschließend wird die Konfiguration der ufw-Firewall angepasst, um eingehenden Datenverkehr auf Port 80, eingehenden Datenverkehr von der IP-Adresse "10.0.3.2" auf Port 22 und eingehenden Datenverkehr von der IP-Adresse "10.0.0.24" auf Port 3306 zu erlauben.
```
Vagrant.configure("2") do |config|
  config.vm.define :firewall do |firewall|
      firewall.vm.box = "ubuntu/xenial64"
      firewall.vm.network :private_network, ip: "10.0.0.11"
      firewall.vm.hostname = "Firewall"
      firewall.vm.provision "shell", inline: <<-SHELL
      apt-get update
      sudo apt-get install ufw
      sudo ufw allow 80/tcp
      sudo ufw allow from 10.0.3.2 to any port 22
      sudo ufw allow from 10.0.0.24 to any port 3306
      sudo ufw --force enable
      SHELL
  end
```

Die "web"-VM hat die IP-Adresse "10.0.0.20" und wird über den Hostnamen "web" identifiziert. Diese VM wird über eine Shell-Provisionierung mit dem Apache-Webserver installiert. Zusätzlich wird ein synchronisierter Ordner zwischen dem Host-Verzeichnis "html/" und dem Gast-Verzeichnis "/var/www/html" eingerichtet. Der Gast-Port 80 wird auf den Host-Port 8090 weitergeleitet.
```
config.vm.define :web do |web|
      web.vm.box = "ubuntu/xenial64"
      web.vm.network :private_network, ip: "10.0.0.24"
      web.vm.hostname = "web"
      web.vm.network "forwarded_port", guest:80, host:8090, auto_correct: true
      web.vm.synced_folder "html/", "/var/www/html"
      web.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get -y install apache2 
      SHELL
  end
```

VM Vagrantfile - ReverseProxy
===
In diesem Vagrantfile werden ebenfalls zwei Virtuelle Maschinen hergestellt und definiert: eine für einen Reverse Proxy und eine für einen Webserver.

Um den Reverse Proxy einzurichten, wird die Box "ubuntu/xenial64" verwendet und erhält eine private IP-Adresse von 10.0.0.11 im privaten Netzwerk. Der Reverse Proxy wird so konfiguriert, dass er auf Port 8080 auf dem Hostsystem lauscht und den eingehenden Datenverkehr an Port 80 auf der virtuellen Maschine weiterleitet. Der Ordner "Config_File/" auf dem Hostsystem wird mit dem Ordner "/etc/apache2/sites-enabled/" auf der VM synchronisiert, um Konfigurationsdateien auszutauschen. Zusätzlich wird die virtuelle Maschine als "reverseproxy" mit dem Hostnamen "reverseproxy" konfiguriert.
```
Vagrant.configure("2") do |config|
  config.vm.define :reverseproxy do |reverseproxy|
      reverseproxy.vm.box = "ubuntu/xenial64"
      reverseproxy.vm.network :private_network, ip: "10.0.0.11"
      reverseproxy.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
      reverseproxy.vm.synced_folder "Config_File/", "/etc/apache2/sites-enabled/"
      reverseproxy.vm.hostname = "reverseproxy"

      reverseproxy.vm.provision "shell", inline: <<-SHELL
      apt-get update
      sudo apt-get install -y apache2
      sudo apt-get install libapache2-mod-proxy-html
      sudo apt-get install libxml2-dev
      sudo a2enmod proxy
      sudo a2enmod proxy_html
      sudo a2enmod proxy_http
      SHELL
      reverseproxy.vm.provision "shell", path: "scripts/init.sh"
      reverseproxy.vm.provision "shell", inline: <<-SHELL
      sudo service apache2 restart
      SHELL
  end
```

Für den Webserver wird ebenfalls die "ubuntu/xenial64" Box verwendet und er erhält eine private IP-Adresse von 10.0.0.20 im privaten Netzwerk. Der Webserver wird so konfiguriert, dass er auf Port 8090 auf dem Hostsystem lauscht und auf Port 80 auf der virtuellen Maschine antwortet. Der Ordner "html/" auf dem Hostsystem wird mit dem Ordner "/var/www/html" auf der VM synchronisiert, um Webinhalte auszutauschen. Die virtuelle Maschine wird auch als "web" mit dem Hostnamen "web" konfiguriert.
```
  config.vm.define :web do |web|
      web.vm.box = "ubuntu/xenial64"
      web.vm.network :private_network, ip: "10.0.0.24"
      web.vm.hostname = "web"
      web.vm.network "forwarded_port", guest:80, host:8090, auto_correct: true
      web.vm.synced_folder "html/", "/var/www/html"
      web.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get -y install apache2 
      SHELL
  end
```

VM Vagrantfile - ReverseProxy with Firewall
===
Bei diesem Vagranfile werden die Vagrantfiles Firewall und ReverseProxy zusammen gefügt:
```
Vagrant.configure("2") do |config|
    config.vm.define :reverseproxy do |reverseproxy|
        reverseproxy.vm.box = "ubuntu/xenial64"
        reverseproxy.vm.network :private_network, ip: "10.0.0.11"
        reverseproxy.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
        reverseproxy.vm.synced_folder "configs/", "/etc/apache2/sites-enabled/"
        reverseproxy.vm.hostname = "reverseproxy"

        reverseproxy.vm.provision "shell", inline: <<-SHELL
        apt-get update
        sudo apt-get install apache2 -y
        sudo apt-get install ufw -y
        sudo apt-get install libapache2-mod-proxy-html -y
        sudo apt-get install libxml2-dev -y
        sudo a2enmod proxy
        sudo a2enmod proxy_html
        sudo a2enmod proxy_http
        sudo ufw allow from 10.0.2.2 to any port 22
        sudo ufw allow 80/tcp
        sudo ufw --force enable
        SHELL
        reverseproxy.vm.provision "shell", path: "scripts/init.sh"
        reverseproxy.vm.provision "shell", inline: <<-SHELL
        sudo service apache2 restart
        SHELL
    end



    config.vm.define :web do |web|
        web.vm.box = "ubuntu/xenial64"
        web.vm.network :private_network, ip: "10.0.0.20"
        web.vm.hostname = "web"
        web.vm.synced_folder "html/", "/var/www/html"
        web.vm.provision "shell", inline: <<-SHELL
        sudo apt-get update
        sudo apt-get -y install apache2 ufw -y
        sudo ufw allow from 10.0.3.2 to any port 22
        sudo ufw allow from 10.0.0.11 to any port 80
        sudo ufw --force enable
        SHELL
    end
end
```

VM Vagrantfile - Authentifizierung und Autorisierung
===

In diesem Vagrantfile wird erneut die "ubuntu/xenial64" Box verwendet. Die Maschine wird mit einer statischen IP-Adresse konfiguriert und lauscht auf Port 80 und 443. Der Ordner "config/" auf dem Host-System wird mit dem Ordner "/etc/apache2/sites-available/" auf der VM synchronisiert, um Konfigurationsdateien auszutauschen. In diesem Ordner befinden sich die erforderlichen Konfigurationen für das SSL-Zertifikat. Anschließend wird Apache installiert und so konfiguriert, dass es SSL unterstützt und ein selbstsigniertes SSL-Zertifikat generiert. Die Standardkonfiguration von Apache wird deaktiviert und durch die neue Konfiguration ersetzt. In diesem Vagrantfile können auch Benutzername und Passwort für die Website angegeben werden, auf die zugegriffen werden soll. Abschließend wird der Apache-Dienst neu gestartet.
```
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "forwarded_port", guest:443, host:443, auto_correct: true
    config.vm.network "forwarded_port", guest:80, host:80, auto_correct: true
    config.vm.hostname = "WebServer"
    config.vm.synced_folder "config/", "/etc/apache2/sites-available/"
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      sudo apt-get install -y apache2
      sudo a2ensite 001-ssl.conf
      sudo a2enmod ssl
      sudo a2dissite 000-default.conf
      sudo a2dissite default-ssl.conf
      sudo htpasswd -b -c /etc/apache2/.htpasswd vagrant Passwort
      sudo service apache2 restart
    SHELL
  end
```
