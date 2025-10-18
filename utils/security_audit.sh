#!/bin/bash
security_audit_function() {
    echo "=== Security Audit ==="
    echo "Checking for rootkits (test mode)..."
    if [[ "$1" == "--test" ]] || [[ "$TEST_MODE" == true ]]; then
        echo "[TEST MODE] Skipping full audit"
    else
        sudo chkrootkit 2>/dev/null
    fi
}
