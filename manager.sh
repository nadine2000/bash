#!/bin/bash

main() {
    
    while true; do
        echo "1. Utility Script"
        echo "2. Read File Script"
        echo "3. Delete Script"
        echo "4. Exit"
        read -p "Select a script to run: " choice

        if [[ $choice == 1 ]]; then
            ./utility.sh
        elif [[ $choice == 2 ]]; then
            ./read.sh
        elif [[ $choice == 3 ]]; then
            ./delete.sh
        elif [[ $choice == 4 ]]; then
            echo "Exiting... Goodbye!"
            break
        else
            echo "Invalid option. Please try again."
        fi
    done
}

main