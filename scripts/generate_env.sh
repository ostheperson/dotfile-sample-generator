#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
  echo "Usage: $0 <path to .env file> <destination folder>"
  exit 1
fi

FILE_PATH="$1"
FILE_NAME=$(basename "$FILE_PATH")
DESTINATION_PATH="$2"

if [ ! -f "$FILE_PATH" ]; then
  echo "Error: .env file not found at '$FILE_PATH', stack: generate_env.sh"
  exit 1
fi

if [ ! -d "$DESTINATION_PATH" ]; then
  echo "Error: Destination folder not found at '$DESTINATION_PATH', stack: generate_env.sh"
  exit 1
fi

# Generate a unique file name for .env.sample
TIMESTAMP=$(date +%Y%m%d%H%M%S)
UNIQUE_FILE_NAME="$FILE_NAME.$TIMESTAMP"

# Create a sample .env file by removing values
awk -F '=' '/^[^#]/ {print $1"="}' "$FILE_PATH" > "$DESTINATION_PATH/$UNIQUE_FILE_NAME"

echo "Unique sample .env file '$UNIQUE_FILE_NAME' created in '$DESTINATION_PATH' with removed values."

