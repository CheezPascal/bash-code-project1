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
    echo "$(printf '#%.0s' {1..40})"
    echo "$(printf '#%.0s' {1..10}) User Management Script $(printf '#%.0s' {1..6})"
    echo "$(printf '#%.0s' {1..40})"
    echo ""
    echo "$(printf '#%.0s' {1..10}) 1. Add a User     $(printf '#%.0s' {1..10})"
    echo "$(printf '#%.0s' {1..10}) 2. Delete a User  $(printf '#%.0s' {1..10})"
    echo "$(printf '#%.0s' {1..10}) 3. List All Users $(printf '#%.0s' {1..10})"
    echo "$(printf '#%.0s' {1..10}) 4. Exit $(printf '#%.0s' {1..10})"
    echo "$(printf '#%.0s' {1..40})"
    read -p "Choose an option [1-4]: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please choose again." ;;
    esac
done
