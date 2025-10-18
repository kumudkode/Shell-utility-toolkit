#!/bin/bash
service_check_function() {
    echo "=== Service Check ==="
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        SERVICES=(ssh cron)
        echo "[TEST MODE] Checking default services: ${SERVICES[*]}"
    else
        read -p "Enter service names (space-separated): " -a SERVICES
    fi
    for svc in "${SERVICES[@]}"; do
        systemctl status "$svc" >/dev/null 2>&1 && echo "$svc running" || echo "$svc not running"
    done
}
