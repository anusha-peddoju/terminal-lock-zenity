#!/bin/bash
password="$(zenity --password --title="Authentication")"
start()
{
	echo
	if [[ `md5sum <<< $password` == `md5sum <<< "user"` ]] #checking password.here we will change user with original password later.
	then
		sleep 1s
		figlet "Welcome"
	else
		sleep 1s
		figlet "enter correct password"
		sleep 3s
		kill $(pgrep terminal) #Killing terminal
	fi
}
dpkg -l md5sum > abc.txt
if [[$?==0]]
then 
	start
else
	ping -c 3 google.com #pinging to google
	if [ $? == 0 ]
	then
		sudo apt install -y ucommon-utils
		start
	else
		echo "check your internet connection"
