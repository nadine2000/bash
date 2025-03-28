#!/bin/bash

confirm_delete() {
    read -p "Are you sure you want to delete? (press y to confirm, press any other key to cancel): " confirmation
    if [[ "$confirmation" != "y" ]]; then
        echo "Operation canceled."
        exit 1
    fi
}

delete_folder_contents() {
    read -p "Enter the folder path: " folder_path
    if [[ ! -d "$folder_path" || -z "$folder_path" ]]; then
        echo "Error: $folder_path is not a directory."
        exit 1
    fi

    file_count=$(ls -1 "$folder_path" | wc -l)
    total_size=$(du -sh "$folder_path" | cut -f1)

    echo "The folder contains $file_count files with the size of $total_size."
    confirm_delete

    rm -rf "$folder_path"/*
    echo "All contents have been deleted."
}

delete_files_by_extension() {
    read -p "Enter the folder path: " folder_path
    if [[ ! -d "$folder_path" ]]; then
        echo "Error: $folder_path is not a directory."
        exit 1
    fi

    read -p "Enter the file extension (without the dot): " extension

    files_to_delete=$(find "$folder_path" -type f -name "*.$extension")
    file_count=$(find "$folder_path" -type f -name "*.$extension" | wc -l)

    if [[ $file_count -eq 0 ]]; then
        echo "No files with the extension .$extension found in $folder_path."
        exit 0
    fi

    echo "Found $file_count files with the extension .$extension in $folder_path:"
    echo "$files_to_delete"
    confirm_delete

    rm -f "$folder_path"/*."$extension"
    echo "All .$extension files in $folder_path have been deleted."
}

main() {
    echo "Delete Options:"
    echo "1. Delete all contents of a folder"
    echo "2. Delete files of a specific extension"
    read -p "Select an option: " choice

    if [[ $choice -eq 1 ]]; then
        delete_folder_contents
    elif [[ $choice -eq 2 ]]; then
        delete_files_by_extension
    else
        echo "Invalid option."
    fi
}

main