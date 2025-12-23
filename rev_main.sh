#!/bin/bash

# Colors for UI
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

clear
echo -e "${BLUE}==========================================${NC}"
echo -e "${GREEN}   HACK THE HECK LAB - ENVIRONMENT SETUP   ${NC}"
echo -e "${BLUE}==========================================${NC}"

# 1. Update System
echo -e "\n${BLUE}[*] Updating system packages...${NC}"
sudo apt-get update -y

# 2. Install Toilet for the UI
echo -e "${BLUE}[*] Installing Toilet for ASCII fonts...${NC}"
sudo apt-get install toilet -y

# 3. Install Python and Pip
echo -e "${BLUE}[*] Installing Python3 and Pip...${NC}"
sudo apt-get install python3 python3-pip -y

# 4. Install PyInstaller (Needed to compile the .exe)
echo -e "${BLUE}[*] Installing PyInstaller via Pip...${NC}"
pip3 install pyinstaller

# 5. Final Check
echo -e "\n${GREEN}==========================================${NC}"
toilet -f standard "READY" --filter metal
echo -e "${GREEN}Environment is ready!${NC}"
echo -e "You can now run your listener or compile your payload."
echo -e "${GREEN}Made by: Hack The Heck Lab${NC}"
echo -e "${BLUE}==========================================${NC}"
