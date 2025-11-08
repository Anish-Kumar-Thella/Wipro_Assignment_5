#!/bin/bash
# backup.sh - Automated system backup script

# === CONFIGURATION ===
SOURCE="/home/$USER/Documents"     # Folder to back up
DEST="/home/$USER/backup"           # Backup destination folder
DATE=$(date +%Y-%m-%d_%H-%M-%S)    # Current date & time
FILENAME="backup_$DATE.tar.gz"     # Backup file name

# === CREATE BACKUP DIRECTORY IF NOT EXIST ===
mkdir -p "$DEST"

# === CREATE THE BACKUP ===
tar -czf "$DEST/$FILENAME" "$SOURCE"

# === CHECK IF BACKUP SUCCESSFUL ===
if [ $? -eq 0 ]; then
    echo "✅ Backup completed successfully!"
    echo "📦 File saved as: $DEST/$FILENAME"
else
    echo "❌ Backup failed!"
fi
