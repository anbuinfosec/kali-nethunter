#!/bin/bash

GREEN="\033[1;32m"
RESET="\033[0m"
RED="\033[1;31m"
YELLOW="\033[1;33m"

cleanup() {
  echo -e "\n${RED}[!] Process canceled by user${RESET}"
  exit
}

trap cleanup SIGINT

banner() {
  echo -e "${GREEN}"
  echo "==========================================="
  echo "      Kali NetHunter Installation Script    "
  echo "               Author: Mohammad Alamin      "
  echo "               GitHub: anbuinfosec         "
  echo "==========================================="
  echo -e "${RESET}"
}

banner

{
  echo -e "${YELLOW}[+] Updating Package... Please wait.${RESET}"
  pkg update -y && pkg upgrade -y

  echo -e "${YELLOW}[+] Installing Necessary Packages... Please wait.${RESET}"
  pkg install wget curl proot git -y

  echo -e "${YELLOW}[+] Downloading Kali NetHunter Installation Script... Please wait.${RESET}"
  wget -O install-nethunter-termux https://offs.ec/2MceZWr

  echo -e "${YELLOW}[+] Setting Permissions for Script... Please wait.${RESET}"
  chmod +x install-nethunter-termux

  echo -e "${YELLOW}[+] Running NetHunter Installation Script... Please wait.${RESET}"
  ./install-nethunter-termux
}
