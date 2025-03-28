#!/bin/bash

list_files() {
    read -p "Sort order (asc/desc): " sort_order
    if [[ $sort_order == "asc" ]]; then
        ls -lShr
    elif [[ $sort_order == "desc" ]]; then
        ls -lSh
    fi
}

count_files_by_extension() {
    for ext in $(ls *.* 2>/dev/null | awk -F. '{print $NF}' | sort | uniq); do
        count=$(ls *."$ext" 2>/dev/null | wc -l)
        size=$(du -ch *."$ext" 2>/dev/null | grep total | awk '{print $1}')
        echo "$count .$ext $size"
    done
}

show_folder_size() {
    read -p "Enter size limit in bytes: " size_limit
    total_size=$(du -sb . | awk '{print $1}')
    echo "Total size: $((total_size / 1024 / 1024)) MB"

    if [[ $total_size -gt $size_limit ]]; then
        echo "Folder size exceeds the limit ($((size_limit / 1024 / 1024)) MB)."
        echo "compress the folder using: tar -czf archive.tar.gz"
        echo "Or delete files using: rm filename or rm -r <foldername>"
    fi
}


main() {
    echo "Utility Operations"
    echo "1. List files by size"
    echo "2. Count files by extension"
    echo "3. Show folder size"
    read -p "Select an option: " choice

    if [ "$choice" -eq 1 ]; then
        list_files 
    elif [ "$choice" -eq 2 ]; then
         count_files_by_extension
    elif [ "$choice" -eq 3 ]; then
         show_folder_size
    else
         echo "invalid option"
    fi

}


main