#!/bin/bash

print_file() {
    while read -r line; do
        echo "$line"
    done < "$file"
}

print_word_line_size() {
    local file=$1
    local word_num=0
    local line_num=0
    local total_size=0

    while read -r line; do
        ((line_num++))
        total_size=$((total_size + ${#line} + 1)) # +1 for newline character
        for word in $line; do
            ((word_num++))
        done
    done < "$file"

    echo "Word number: $word_num"   
    echo "Line number: $line_num"   
    echo "Total file size: $total_size bytes"
}


search_file() {

    local file=$1   
    read -p "Enter word to search: " word_to_search  
    local word_num=0
    local found=false

    while read -r line; do
        for word in $line; do
            ((word_num++))
            if [[ $word == $word_to_search ]]; then
                echo "(true, $word num $word_num)"
                found=true
            fi
        done
    
    done < "$file"

    if [ "$found" = false ]; then
        echo "No matches found"
    fi
}

main() {

    echo "Read file Operations"
    echo "1. Print file"
    echo "2. Print word number, line number and total file size"
    echo "3. Search file"
    read -p "Select an option: " choice

    read -p "Enter file name: " file
    if [[ ! -f $file ]]; then
        echo "File not found!"
        exit 1
    fi

   if [ "$choice" -eq 1 ]; then
        print_file "$file"
    elif [ "$choice" -eq 3 ]; then
        search_file "$file"
    elif [ "$choice" -eq 2 ]; then
        print_word_line_size "$file"
    else
         echo "invalid option"
    fi
}

main