#!/bin/bash

# Function to add a user
add_user() {
    read -p "Enter the username to add: " username
    sudo useradd "$username" && echo "User '$username' added successfully." || echo "Failed to add user '$username'."
}

# Function to delete a user
delete_user() {
    read -p "Enter the username to delete: " username
    sudo userdel "$username" && echo "User '$username' deleted successfully." || echo "Failed to delete user '$username'."
}

# Function to list all users
list_users() {
    echo "Listing all users on the system:"
    cut -d: -f1 /etc/passwd
}

# Main menu
while true; do
    echo "User Management Script"
    echo "1. Add a User"
    echo "2. Delete a User"
    echo "3. List All Users"
    echo "4. Exit"
    read -p "Choose an option [1-4]: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please choose again." ;;
    esac
done
