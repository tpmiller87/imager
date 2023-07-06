#!/bin/bash


if [[ $EUID -ne 0 ]]; then
    echo "You must run this script as root!"
    exit 1
fi

read -p "What non-root user should own these tools?:  " user

echo "$user will own the directory 'my_tools' and everything in it."
echo "Exit this script if this is not what you want!"
sleep 5
echo "Starting the preferred tools startup script..."
sleep 2
#update repos

apt update

mkdir my_tools
cd my_tools

#chrome install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i *chrome*
rm *chrome*

#name that hash install
apt install name-that-hash -y

#golang install
apt install golang-go -y

#SharpCollection install
git clone https://github.com/Flangvik/SharpCollection.git

#crackmapexec update - latest 6.0.0 "BANE"
wget https://github.com/mpgn/CrackMapExec/releases/download/v6.0.0/cme-ubuntu-latest-3.11.zip
unzip cme-ubuntu-latest-3.11.zip
chmod +x cme
cp cme /usr/bin 

#make permissions all for user 'kali' from root
cd -
chown -R $user:$user my_tools

#to-do:
#TBD
