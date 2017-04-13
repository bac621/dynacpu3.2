#!/bin/sh

echo "\nUpdatin.. upgrade later if you want with sudo apt-get upgrade!"
sleep 6
sudo apt-get update

echo "\nDownloading and Installing Dynamic version 1.0.3..."
while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 10; 
kill $! && trap " " EXIT
wget https://github.com/duality-solutions/Dynamic/releases/download/v1.3.0.1/Dynamic-Linux-x64-v1.3.0.1.tar.gz
tar -xzf Dynamic-Linux-x64-v1.3.0.1.tar.gz

echo "\nStarting Dynamic...\n"
echo "\nGiver about a minute eh.."
cd dynamic-1.3.0/bin 
./dynamicd -daemon
while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 30; 
kill $! && trap " " EXIT 
echo
echo "\n30 more seconds or so k..."
while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 27; 
kill $! && trap " " EXIT
echo
echo "\nGenerating Config file for ya"
while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 5; 
kill $! && trap " " EXIT
pkill dynamicd
echo "\nDone"
sleep 3

echo "\nDownloading Dynamic blockchain.. (post-fork)"
cd ~/
wget http://108.61.216.160/cryptochainer.chains/chains/Dynamic_blockchain.zip
sleep 5
echo "Grabbin unzip utility.."
sleep 5
sudo apt-get install unzip


echo "\nRemoving old junk in data directory..."
cd ~/.dynamic
sudo rm -rf blocks
sudo rm -rf chainstate 
sudo rm -rf peers.dat

while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 10; 
kill $! && trap " " EXIT
echo

echo "\nGrabbing blocks and cleaning house..."
cd ~/
sudo mv Dynamic_blockchain.zip ~/.dynamic

while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 15; 
kill $! && trap " " EXIT
echo

cd ~/.dynamic
sudo unzip Dynamic_blockchain.zip
rm -rf Dynamic_blockchain.zip
cd
rm -rf Dynamic-Linux-x64-v1.3.0.1.tar.gz

echo "\nSyncing da New Chain"
while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 22; 
kill $! && trap " " EXIT
echo
echo "\nLong Live Dynamic CPU mining"
cd dynamic-1.3.0/bin 
sudo ./dynamicd -daemon 

while :;do echo -n .;sleep 1;done &
trap "kill $!" EXIT 
sleep 15; 
kill $! && trap " " EXIT
echo

sleep 5
echo "\nDisplay infos."
echo
sudo ./dynamic-cli getinfo
sleep 5 
echo "\nSetting up mining for 1 core.."
sleep 5
sudo ./dynamic-cli setgenerate true 1
echo "\nDone"
sleep 5
echo "\nDisplay Mining info."
echo
sudo ./dynamic-cli getmininginfo
echo
echo "\nYour hash will display when the chain finishes syncing."
echo
sleep 2
echo "\n./dynamic-cli getinfo"
echo "\n./dynamic-cli getmininginfo"
echo "\n./dynamic-cli sendtoaddress"
echo "\n./dynamic-cli setgenerate true"
echo "\nHappy mining."
