#!/bin/bash

# Shell script that processes images.
GREEN="\e[32m"
RED="\e[31m"
EXIT="\e[0m"

if [ $# -eq 0 ]; then 
    echo -e "Usage: $0 [File-1] [File-2] .... [File-n]"
    exit 1
fi

for input_file in "$@"; do
    if [ -f "$input_file" ]; then    
        output_file="${input_file%.*}.jpg"
        if convert "$input_file" "$output_file"; then
            echo -e "${GREEN}[+] File conversion completed ${EXIT}"
        else
            echo -e "${RED}ERROR: Conversion failed for $input_file${EXIT}"
        fi
    else
        echo -e "${RED}ERROR: $input_file is not a regular file${EXIT}"
    fi
done
