#!/bin/bash

start()
{
password=$(zenity --password --title="Authentication") #Reading Password from User
echo
sed "s/user/$password/g" key.sh > setlock #Replacing current password in key.sh file and putting it in setlock file.
rm key.sh #removing key.sh file
sudo chmod +x  setlock #giving excutable permission to setlock
sudo mv setlock /usr/bin #moving setlock to /usr/bin Directory
sudo echo setlock  >> $HOME/.bashrc #adding setlock file to .bashrc file in home to run start in terminal.
#here bashrc file only runs the file present in /usr/bin.
sudo rm -r ../terminal-lock-zenity #removing terminal-lock-zenity directory.
}


#zenity installed checking about figlet to start the program
dpkg -l zenity > abc.txt #checking zenity
if [ $? == 0 ]
then
	dpkg -l figlet > abc.txt #checking figlet
	if [ $? == 0 ]
	then
		start
	else #figlet is not installed.trying to install figlet
		ping -c 3 google.com #pinging to google
		if [ $? == 0 ]
		then
			sudo apt-get update -y
			sudo apt-get install figlet -y
			start
		else
			echo "check your internet connection"
		fi
	fi
#zenity is not installed checking about figlet and installing the packages which are not installed
else
	dpkg -l figlet > abc.txt
	if [ $? == 0 ]
	then
		ping -c 3 google.com
		if [ $? == 0 ]
		then
			sudo apt-get update -y
			sudo apt-get install zenity -y
			start
		else
			echo "check your internet connection"
		fi
	else
		ping -c 3 google.com
		if [ $? == 0 ]
		then
			sudo apt-get update -y
			sudo apt-get install figlet -y
			sudo apt-get install zenity -y
			start
		else
			echo "check your internet connection"
		fi
	fi
fi


