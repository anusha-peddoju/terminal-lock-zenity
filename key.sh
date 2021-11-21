#!/bin/bash
password="$(zenity --password --title="Authentication")"
echo
if [[ $password == "user" ]] #checking password.here we will change user with original password later.
then
	sleep 1s
	figlet "Welcome"
else
	sleep 1s
	figlet "You are not an Authorised User"
	sleep 3s
	kill $(pgrep terminal) #Killing terminal
fi

