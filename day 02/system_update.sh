#!/bin/bash
# system_update.sh - System Update and Cleanup Script

# === DEFINE LOG FILE ===
LOG_FILE="/home/$USER/backup/system_update_log.txt"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo "===============================" >> "$LOG_FILE"
echo "🕒 SYSTEM UPDATE STARTED AT: $DATE" >> "$LOG_FILE"
echo "===============================" >> "$LOG_FILE"

# === UPDATE PACKAGE LIST ===
echo "🔄 Updating package list..."
sudo apt update -y >> "$LOG_FILE" 2>&1

# === UPGRADE INSTALLED PACKAGES ===
echo "⬆️  Upgrading installed packages..."
sudo apt upgrade -y >> "$LOG_FILE" 2>&1

# === REMOVE UNNECESSARY PACKAGES ===
echo "🧹 Removing unnecessary packages..."
sudo apt autoremove -y >> "$LOG_FILE" 2>&1
sudo apt autoclean -y >> "$LOG_FILE" 2>&1

# === DISPLAY DISK USAGE ===
echo "💾 Current Disk Usage:"
df -h | grep "^/dev" | tee -a "$LOG_FILE"

echo "✅ System update and cleanup completed!"
echo "📝 Log saved at: $LOG_FILE"