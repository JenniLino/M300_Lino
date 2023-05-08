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

nano /etc/apache2/apache2.conf  --ServerName localhost

