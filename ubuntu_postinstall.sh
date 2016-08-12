#!/bin/bash

echo 'Backup du sources.list et Mise à jour des sources logiciels';
sleep 5s;

cp /etc/apt/sources.list /etc/apt/sources.list.cp;

# Add repos signing key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886; # Spotify
apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E; # DropBox

# Modifications des dépots
add-apt-repository "deb http://linux.dropbox.com/ubuntu trusty main";
add-apt-repository "deb ppa:webupd8team/sublime-text-2";
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list;

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
apt-get install -y python-gpgme;
apt-get install -y git;
apt-get install -y vagrant;
sudo apt-get install spotify-client;


exit 0;
