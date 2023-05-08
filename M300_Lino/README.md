# M300_Lino# M300


## Github einrichten
 
Um auf das GitHub-Repository vom lokalen PC aus zugreifen zu können, muss zuerst ein SSH-Schlüssel erstellt werden. Dies kann leicht mit dem folgenden Befehl erreicht werden.
    ```bash
    ssh-keygen -t rsa -b 4096 -C "Zirusgaming@gmail.com"
    ```

Nun müssen wir den Key in unserem Github Konto hinzufügen. Dazu bei Github auf Einstellungen und dann unter SSH and GPG keys` denn Key hinterlegen. Den Key findet man in der eben erstellten Datei ```id_rsa.pub```. Diese liegt bei Default im Verzeichnis 

### Git Befehle

    | Befehl        | Beschreibung                                              |
    |---------------|-----------------------------------------------------------|
    | `git init`    | Erstellt ein neues Git-Repository im aktuellen Verzeichnis |
    | `git add`     | Fügt Änderungen hinzu                  |
    | `git commit`  | Speichert Änderungen im Repository                        |
    | `git clone`   | Erstellt eine Kopie eines Remote-Repositories              |
    | `git pull`    | Aktualisiert lokale Änderungen mit den neuesten Änderungen Online |
    | `git push`    | Überträgt lokale Änderungen an ein Remote-Repository       |
    | `git branch`  | Erstellt, löscht oder zeigt Branches im Repository an      |
    | `git merge`   | Führt zwei oder mehr Branches zusammen                     |
    | `git status`  | Zeigt den Status der Arbeitskopie und des Repositories an  |
    | `git log`     | Zeigt die Versionsgeschichte an                            |




# Infrastruktur

## Virtualbox installieren
Virtualbox kann man hier [www.virtualbox.org](https://www.virtualbox.org/wiki/Downloads) downloaden und installieren

## Vagrant installieren
Vagrant kann man hier [www.vagrantup.com](https://www.vagrantup.com/downloads) downloaden und installieren.

## VM mit Vagrant erstellen

Eine Vagrant VM muss immer in einem Verzeichnis erstellt werden. Ich habe ```C:\users\\M300\LB2``` dafür genommen. Danach in diesem Verzeichnis den folgenden Befehl ausführen 
    ```bash
    vagrant init ubuntu/xenial64
    ```
Jetzt wird ein Vagrantfile erstellt von der jeweiligen Vagrant Box die man ausgewählt hat. Vagrant Boxen sind wie eine Art vorgefertigte VM Templates.
    ```ubuntu/xeniial64``` ist in diesem Fall die eben genannte Vagrant Box. Man findet diese auch auf der Vagrant Cloud

Mit ```vagrant up``` kann man nun die Vagrantfile starten. Jetzt wird die Box/Image von dem Internet heruntergeladen (falls sie nicht schon lokal vorhanden ist) und eine VM erstellt. Dabei werden die ganzen Konfigurationen im Vagrantfile berücksichtigt.
    ```bash
    vagrant up
    ```
    
Mit ```vagrant ssh``` kann man sich nun auf die VM verbinden.
    ```bash
    vagrant ssh
    ```

### Vagrant Commands

    | Befehl               | Beschreibung                                           |
    |----------------------|--------------------------------------------------------|
    | `vagrant up`         | Startet und provisioniert eine neue virtuelle Maschine |
    | `vagrant ssh`        | Verbindet sich per SSH zur laufenden VM                |
    | `vagrant halt`       | Stoppt die laufende VM                                  |
    | `vagrant destroy`    | Löscht die VM und alle zugehörigen Ressourcen          |
    | `vagrant status`     | Zeigt den Status aller VMs im aktuellen Verzeichnis an |
    | `vagrant init`       | Initialisiert ein neues Vagrant-Projekt im Verzeichnis  |
    | `vagrant reload`     | Neustartet die VM und lädt die Vagrant-Konfiguration    |
    | `vagrant suspend`    | Pausiert die laufende VM                                |
    | `vagrant resume`     | Nimmt eine pausierte VM wieder auf                      |
    | `vagrant provision`  | Führt eine erneute Provisionierung auf der VM durch     |


