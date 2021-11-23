#!/bin/bash
password="$(zenity --password --title="Authentication")"
start()
{
	a=`md5sum <<< $password`
	b= `md5sum <<< "user"`
	echo
	if [[ $a == $b ]] #checking password.here we will change user with original password later.
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
	sudo apt install -y ucommon-utils
	start
