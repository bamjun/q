#!/bin/bash

COLOR_RESET="\033[0m"

echo -e "\033[48;5;11m\033[38;5;21m◇  linux  ◇ ${COLOR_RESET}"

echo -e "\033[48;5;228m\033[38;5;0m  - To check the disk usage of the top-level directories ${COLOR_RESET}"
echo -e "\033[48;5;230m\033[38;5;0m    sudo du -h --max-depth=1 / ${COLOR_RESET}"

