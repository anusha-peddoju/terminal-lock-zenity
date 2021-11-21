#!/bin/bash

password=$(zenity --password --title="Authentication") #Reading Password from User
echo
sed "s/user/$password/g" key.sh > setlock #Replacing current password in key.sh file and putting it in setlock file.
rm key.sh #removing key.sh file
sudo chmod +x  setlock #giving excutable permission to setlock
sudo mv setlock /usr/bin #moving setlock to /usr/bin Directory
sudo echo setlock  >> $HOME/.bashrc #adding setlock file to .bashrc file in home to run start in terminal.
#here bashrc file only runs the file present in /usr/bin.
sudo rm -r ../terminal_lock_zenity #removing terminal-lock-zenity directory.

