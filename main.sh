#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
  echo "Usage: $0 <path to app.yaml file> [destination folder]"
  exit 1
fi

# Assign the file path and destination path from command line arguments
FILE_PATH="$1"
DESTINATION_PATH="../generated-files"

if [ $# -eq 2 ]; then
  DESTINATION_PATH="$2"
fi

# Extract the file name from the file path
FILE_NAME=$(basename "$FILE_PATH")

# Determine the file type based on the file name
case "$FILE_NAME" in
  app.yaml)
    # Call the script for generating sample app.yaml
    ./scripts/generate_app_yaml.sh "$FILE_PATH" "$DESTINATION_PATH"
    ;;
  .env)
    # Call the script for generating sample .env

    ./generate_env.sh "$FILE_PATH" "$DESTINATION_PATH"
    ;;
  *)
    echo "Unsupported file type: $FILE_NAME"
    exit 1
    ;;
esac

