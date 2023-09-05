#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
  echo "Usage: $0 <path to app.yaml file> <destination folder>"
  exit 1
fi

# Assign the path to the app.yaml file from the command line argument
APP_YAML_PATH="$1"
SAMPLE_FILE_NAME='sample.yaml'
DESTINATION_FOLDER="../generated-files"
if [ $# -eq 2 ]; then
  DESTINATION_FOLDER="$2"
fi

if [ ! -f "$APP_YAML_PATH" ]; then
  echo "Error: app.yaml file not found at '$APP_YAML_PATH', stack: generate_app_yaml.sh"
  exit 1
fi

if [ ! -d "$DESTINATION_FOLDER" ]; then
  echo "Error: Destination folder not found at '$DESTINATION_FOLDER', stack: generate_app_yaml.sh"
  exit 1
fi


# Generate a unique file name for .env.sample
TIMESTAMP=$(date +%Y%m%d%H%M%S)
UNIQUE_FILE_NAME="$SAMPLE_FILE_NAME.$TIMESTAMP"

# Create the full path for the generated sample_app.yaml file
GENERATED_YAML="$DESTINATION_FOLDER/$UNIQUE_FILE_NAME"

# Create a new app.yaml file with the desired format
awk '
  /env_variables:/ {
    print
    while(getline && $0 ~ /^[ ]+[A-Za-z0-9_]+:/) {
      print "\t" $1
    }
  }
  !/env_variables:/ {print}
' "$APP_YAML_PATH" > "$GENERATED_YAML"

echo "Sample app.yaml file created as sample_app.yaml"
