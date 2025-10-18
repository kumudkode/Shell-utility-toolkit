#!/bin/bash
network_check_function() {
    echo "=== Network Check ==="
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        PING_TARGET="8.8.8.8"
        echo "[TEST MODE] Pinging $PING_TARGET..."
    else
        read -p "Enter host to ping: " PING_TARGET
    fi
    ping -c 2 "$PING_TARGET"
}
