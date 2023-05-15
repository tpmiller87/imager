#!/bin/bash

echo "Starting the preferred tools startup script..."
sleep 2
#update repos

sudo apt update

mkdir my_tools
chown kali:kali my_tools
cd my_tools

#chrome install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i *chrome*
rm *chrome*

#name that hash install
apt install name-that-hash -y

#golang install
apt install golang-go -y

#SharpCollection install
git clone https://github.com/Flangvik/SharpCollection.git

#make permissions all for user 'kali' from root
chown kali:kali *

#to-do:
#eyewitness
#
#
#
#
#
