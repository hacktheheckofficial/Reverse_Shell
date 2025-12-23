#!/bin/bash

# Define colors for the UI
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to show the banner
show_banner() {
    clear
    # Uses toilet for the stylized font as requested
    toilet -f standard "HTH LAB" --filter border:metal
    echo -e "${GREEN}Made by: Hack The Heck Lab${NC}"
    echo "------------------------------------------"
}

# Function to start the listener
start_listener() {
    show_banner
    PORT=87
    echo -e "${GREEN}[+] Starting Reverse Shell Listener on Port $PORT...${NC}"
    echo "[!] Waiting for Machine B to connect..."
    # The command from your notes: nc -lnvp <port>
    nc -lnvp $PORT
}

# Function to stop any running listeners
stop_listener() {
    show_banner
    echo -e "${RED}[-] Stopping all Netcat listeners...${NC}"
    pkill nc
    sleep 1
    echo -e "${GREEN}[+] Cleaned up successfully.${NC}"
}

# Simple UI Menu
show_banner
echo "1) Start Listener"
echo "2) Stop Listener"
echo "3) Exit"
read -p "Select an option: " choice

case $choice in
    1) start_listener ;;
    2) stop_listener ;;
    3) exit 0 ;;
    *) echo "Invalid option" ;;
esac
