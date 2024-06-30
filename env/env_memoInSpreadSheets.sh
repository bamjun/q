#!/bin/bash

script_path=$(realpath "$0" | tr '\\' '/')
echo "$script_path"
script_dir=$(dirname "$script_path")
echo "$script_dir"



get_ini_value() {
    local ini_file section key

    while getopts "f:s:k:" opt; do
        case $opt in
        f) ini_file="$OPTARG" ;;
        s) section="$OPTARG" ;;
        k) key="$OPTARG" ;;
        *) echo "Usage: $0 -f ini_file [-s section] -k key" && return ;;
        esac
    done

    if [ -z "$ini_file" ] || [ -z "$key" ]; then
        echo "Usage: $0 -f ini_file -s section -k key"
        return
    fi

    script_dir=$(script_dir)    

    local value=$(awk -F '=' '/\['"$section"'\]/{flag=1;next}/\[/ {flag=0} flag && $1~/'"$key"'/ {print $2}' "$script_dir/$ini_file" | tr -d ' ')
    echo "$value"
}

# 사용 예제
value=$(get_ini_value -f "config.ini" -s "GoogleAppsScript" -k "spreadsheets_key")
echo "The spreadsheets_key in GoogleAppsScript section is: $value"
