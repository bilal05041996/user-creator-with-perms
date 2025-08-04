# User Creation and Secure Directory Setup Script

This Bash script automates the process of creating a new Linux user, optionally setting a password, and creating a secure `docs` directory in the user's home folder.

## Features

- Checks if the user already exists
- Creates the user if not present
- Optionally sets or resets the user’s password
- Creates `/home/<username>/docs` with 700 permissions (private to the user)

## Usage

1. Make the script executable:
   ```bash
   chmod +x user_create_and_setup.sh
2. Run the script:
./user_create_and_setup.sh
3. Follow the prompts:

     Enter a username

     Choose whether to set a password

Eg:

$ ./user_create_and_setup.sh
Enter username to create
devuser
User 'devuser' does not exist. Creating user...
User 'devuser' is created.
Do you want to re(set) password for 'devuser'? (yes/no)
yes
Set password for devuser
...
Directory /home/devuser/docs created with secure permission

Requirements
Run as a user with sudo privileges

Tested on Ubuntu/Debian-based systems
