#!/bin/bash

echo 'Backup du sources.list et Mise à jour des sources logiciels';
sleep 5s;

cp /etc/apt/sources.list /etc/apt/sources.list.cp;

# -- 
# Add repos signing key
# -- 

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886; # Spotify
apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E; # Dropbox

# -- 
# Modifications des dépots
# -- 

add-apt-repository "deb http://linux.dropbox.com/ubuntu trusty main";
add-apt-repository "deb ppa:webupd8team/sublime-text-2"; +
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list;

# -- 
# Mise à jour de la distribution
# -- 

echo 'Mise à jour de la distribution';
sleep 5s;
apt-get update;

# -- 
# Installation des logiciels nécéssaires au développeur
# -- 

echo 'Installation des logiciels';
sleep 5s;

apt-get install -y dropbox;
echo 'Connexion à Dropbox';
sleep 5s;
dropbox start -i;
apt-get install -y virtualbox;
apt-get install -y chromium-browser;
apt-get install -y xpad;
apt-get install -y vim;
apt-get install -y sublime-text; +
apt-get install -y python-gpgme;
apt-get install -y git;
apt-get install -y vagrant;
apt-get install -y spotify-client;
apt-get install -y terminator;
apt-get install -y filezilla;
apt-get install -y apache2;
apt-get install -y php;
apt-get install -y mysql-server;
apt-get install -y libapache2-mod-php;
apt-get install -y php-mysql;

echo 'Attente de synchronisation de Dropbox';
sleep 1800s;

# -- 
# Git
# -- 

echo 'Configuration de Git';
sleep 5s;
git config --global user.name "Julien D.";
git config --global user.email "dogooju@gmail.com";
# echo 'restauration du (des) dépot(s) Git';
# sleep 5s;
# cd ~/Git;
# git clone https://github.com/juju2901/...;
# git clone https://github.com/...;

# -- 
# Installation de dokuwiki en local
# -- 

echo 'Installation de Dokuwiki';
sleep 5s;
cd /home/julien/Téléchargements;
wget "https://download.dokuwiki.org/get?id=c5525093cf2c4f47e2e5d2439fe13964";
cp -R dokuwiki /var/www/html;
rsync /home/julien/Dropbox/backup/ /var/www/html/;
chown -R www-data:www-data /var/www/html/dokuwiki;

# -- 
# Récupération d'un serveur Debian
# -- 

echo 'Configuration de Vagrant';
mkdir /home/julien/Vagrant;
chmod -R 777 /home/julien/Vagrant;
cd /home/julien/Vagrant;
vagrant init debian/jessie64 https://atlas.hashicorp.com/debian/boxes/jessie64;
vagrant up;

# -- 
# Mise en place du backup des fichiers importants vers le Dropbox
# -- 

echo 'Mise en place du backup du répertoire /var/www/html';
sleep 5s;
echo "rsync --delete-after -r /var/www/html/ ~/Dropbox/backup/www.html/" | sudo tee -a /etc/crontab;

echo 'Mise en place du backup du répertoire /Git';
sleep 5s;
echo "rsync --delete-after -r ~/Git/* ~/Dropbox/backup/git/" | sudo tee -a /etc/crontab;


exit 0;
