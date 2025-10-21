#!/bin/bash

# TouchPad Control Script for Ubuntu
# This script dynamically detects the touchpad device and toggles its state

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to display usage information
usage() {
    echo "Usage: $0 [on|off|toggle|status]"
    echo "  on     - Enable the touchpad"
    echo "  off    - Disable the touchpad"
    echo "  toggle - Toggle touchpad state"
    echo "  status - Show current touchpad status"
    echo ""
    echo "If no argument is provided, the script will toggle the touchpad state."
    exit 1
}

# Function to find touchpad device ID
find_touchpad_id() {
    # Try to find touchpad by common names
    local touchpad_id=$(xinput list | grep -i "touchpad" | grep -oP 'id=\K\d+' | head -n 1)
    
    # If not found, try alternative names
    if [ -z "$touchpad_id" ]; then
        touchpad_id=$(xinput list | grep -iE "synaptics|trackpad|glidepoint" | grep -oP 'id=\K\d+' | head -n 1)
    fi
    
    echo "$touchpad_id"
}

# Function to get touchpad status
get_touchpad_status() {
    local touchpad_id=$1
    local status=$(xinput list-props "$touchpad_id" | grep "Device Enabled" | grep -oP ':\s*\K\d+')
    echo "$status"
}

# Function to enable touchpad
enable_touchpad() {
    local touchpad_id=$1
    xinput enable "$touchpad_id"
    echo -e "${GREEN}✓ Touchpad enabled${NC}"
}

# Function to disable touchpad
disable_touchpad() {
    local touchpad_id=$1
    xinput disable "$touchpad_id"
    echo -e "${RED}✗ Touchpad disabled${NC}"
}

# Function to toggle touchpad
toggle_touchpad() {
    local touchpad_id=$1
    local status=$(get_touchpad_status "$touchpad_id")
    
    if [ "$status" -eq 1 ]; then
        disable_touchpad "$touchpad_id"
    else
        enable_touchpad "$touchpad_id"
    fi
}

# Function to show touchpad status
show_status() {
    local touchpad_id=$1
    local touchpad_name=$(xinput list | grep "id=$touchpad_id" | grep -oP '↳\s*\K[^id]+' | sed 's/\s*$//')
    local status=$(get_touchpad_status "$touchpad_id")
    
    echo -e "${YELLOW}Touchpad Information:${NC}"
    echo "  Device ID: $touchpad_id"
    echo "  Device Name: $touchpad_name"
    
    if [ "$status" -eq 1 ]; then
        echo -e "  Status: ${GREEN}Enabled${NC}"
    else
        echo -e "  Status: ${RED}Disabled${NC}"
    fi
}

# Main script execution
main() {
    # Check if xinput is available
    if ! command -v xinput &> /dev/null; then
        echo -e "${RED}Error: xinput is not installed. Please install it first.${NC}"
        echo "Install with: sudo apt-get install xinput"
        exit 1
    fi
    
    # Find touchpad ID
    TOUCHPAD_ID=$(find_touchpad_id)
    
    if [ -z "$TOUCHPAD_ID" ]; then
        echo -e "${RED}Error: Could not find touchpad device.${NC}"
        echo "Please check your touchpad connection or run 'xinput list' to see available devices."
        exit 1
    fi
    
    # Parse command line argument
    ACTION="${1:-toggle}"
    
    case "$ACTION" in
        on|enable)
            enable_touchpad "$TOUCHPAD_ID"
            ;;
        off|disable)
            disable_touchpad "$TOUCHPAD_ID"
            ;;
        toggle)
            toggle_touchpad "$TOUCHPAD_ID"
            ;;
        status)
            show_status "$TOUCHPAD_ID"
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo -e "${RED}Error: Invalid argument '$ACTION'${NC}"
            usage
            ;;
    esac
}

# Run main function
main "$@"
