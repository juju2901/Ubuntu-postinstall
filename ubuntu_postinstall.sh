#!/bin/bash

echo 'Backup du sources.list et Mise à jour des sources logiciels';
sleep 5s;

cp /etc/apt/sources.list /etc/apt/sources.list.cp;

# Modification des dépots
add-apt-repository "deb http://linux.dropbox.com/ubuntu trusty main";
add-apt-repository "deb ppa:webupd8team/sublime-text-2";

echo 'Mise à jour de la distribution';
sleep 5s;

apt-get update;

echo 'Installation des logiciels';
sleep 5s;

apt-get install -y virtualbox;
apt-get install -y chromium-browser;
apt-get install -y xpad;
apt-get install -y vim;
apt-get install -y sublime-text;
apt-get install -y dropbox;
apt-get install -y git;
apt-get install -y vagrant;


exit 0;
