#!/bin/bash
memory_monitor_function() {
    echo "=== Memory Monitor ==="
    free -h
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping interactive commands"
    else
        read -p "Press Enter to continue..."
    fi
}
