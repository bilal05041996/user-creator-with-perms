#!/bin/bash

#Description: Script to create a user and set folder permission

echo "Enter username to create"
read USERNAME

#Check if user already exists
if id "$USERNAME" &>/dev/null; then
	echo "User '$USERNAME' already exists".
else
	echo "User '$USERNAME' does not exist. Creating user..."

	#Acyualy creating the user, here -m defines the home directory will also gets created.
	sudo useradd -m "$USERNAME"
	if [ $? -eq  0 ]; then
		echo "User '$USERNAME' is created."
	else
		echo "Failed to create user '$USERNAME'."
		exit 1
	fi

fi

#Prompt to set password only if the user was just created
echo "Do you want to re(set) password for '$USERNAME'? (yes/no)"
read SET_PWD

if [[ "$SET_PWD" == "yes" ]]; then
	echo "Set password for $USERNAME"
	sudo passwd $USERNAME
elif [[ "$SET_PWD" == "no" ]]; then
	echo "Password not changed for '$USERNAME'."
else
	echo "Inavlid option, please enter yes or no"
fi

#Create a home directory folder and set permission
USER_DIR="/home/$USERNAME/docs"

#Create the directory if it doesn't exist
if [ ! -d "$USER_DIR" ]; then

       sudo mkdir -p "$USER_DIR"

       #Set ownership to the user
       sudo chown "$USERNAME":"$USERNAME" "$USER_DIR"

       #Set permission: only user can access
       sudo chmod 700  "$USER_DIR"

       echo "Directory $USER_DIR created with secure permission"
else
	echo "Directory $USER_DIR already exists."
fi
