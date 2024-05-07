#!/bin/bash

# Shell script that processes images.

if [ $# -eq 0 ]
then 
    echo "Usage: $0 [File-1] [File-2] .... [File-n]"
    exit 1
fi

for i in "$@"
do
    if [ -f "$i" ]
    then    
        file_name=$(echo "$i" | sed 's/\.[^.]*$//')
        convert "$i" "$file_name.jpg"
    else
        echo "ERROR: $i is not a regular file"
    fi
done

echo "[+] File conversion completed.."
