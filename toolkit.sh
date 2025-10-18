#!/bin/bash
# ===============================
# Shell Utility Toolkit - Main File
# ===============================

# Make script location absolute
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load all utils safely
for util in "$BASE_DIR/utils/"*.sh; do
  [ -f "$util" ] && source "$util"
done

# Banner
echo "🔧 Welcome to the Shell Utility Toolkit 🔧"
echo "------------------------------------------"

# Display all available tools dynamically
TOOLS=($(ls "$BASE_DIR/utils"/*.sh 2>/dev/null | xargs -n1 basename | sed 's/.sh//'))

echo "Available tools:"
for i in "${!TOOLS[@]}"; do
  echo "  [$((i+1))] ${TOOLS[$i]}"
done

echo "------------------------------------------"

# Accept input
if [ "$1" == "--test" ]; then
  echo "[TEST MODE] Running all scripts automatically..."
  for tool in "${TOOLS[@]}"; do
    echo "▶ Running: $tool"
    bash "$BASE_DIR/utils/${tool}.sh" --test >/dev/null 2>&1
    sleep 0.2
  done
  echo "✅ Toolkit self-test complete."
  exit 0
fi

read -p "Enter the number to execute a tool: " choice
tool_index=$((choice - 1))

if [ -n "${TOOLS[$tool_index]}" ]; then
  bash "$BASE_DIR/utils/${TOOLS[$tool_index]}.sh"
else
  echo "❌ Invalid choice. Exiting."
  exit 1
fi
