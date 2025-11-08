#!/bin/bash
# maintenance_suite.sh - Bash Scripting Suite for System Maintenance

# === SETUP PATHS ===
BACKUP_SCRIPT="./backup.sh"
UPDATE_SCRIPT="./system_update.sh"
LOG_MONITOR_SCRIPT="./log_monitor.sh"

# === CHECK IF DEPENDENCIES EXIST ===
for script in "$BACKUP_SCRIPT" "$UPDATE_SCRIPT" "$LOG_MONITOR_SCRIPT"
do
    if [ ! -f "$script" ]; then
        echo "❌ Missing required script: $script"
        echo "Please ensure all three scripts are in the same directory."
        exit 1
    fi
done

# === MAIN MENU LOOP ===
while true; do
    clear
    echo "======================================"
    echo " 🧰  SYSTEM MAINTENANCE SUITE (LinuxOS + LSP)"
    echo "======================================"
    echo "[1] : Perform System Backup"
    echo "[2] : Run System Update & Cleanup"
    echo "[3] : Monitor System Logs"
    echo "[4] : Exit"
    echo "--------------------------------------"
    read -p "👉 Enter your choice [1-4]: " choice

    case $choice in
        1)
            echo "📦 Running backup script..."
            bash "$BACKUP_SCRIPT"
            read -p "Press Enter to return to menu..."
            ;;
        2)
            echo "🔄 Running system update script..."
            bash "$UPDATE_SCRIPT"
            read -p "Press Enter to return to menu..."
            ;;
        3)
            echo "🔍 Running log monitor script..."
            bash "$LOG_MONITOR_SCRIPT"
            read -p "Press Enter to return to menu..."
            ;;
        4)
            echo "👋 Exiting the maintenance suite. Goodbye!"
            exit 0
            ;;
        *)
            echo "⚠️  Invalid choice. Please try again."
            sleep 2
            ;;
    esac
done