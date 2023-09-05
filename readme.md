# Sample File Generator Script

## Overview

This script is designed to generate sample configuration files for different file types, allowing you to quickly create template files with placeholders for values. It's particularly useful when you want to share configuration templates or create sample environment files.

## Features

- Supports generating sample files for multiple file types.
- Allows customization of output format for each file type.
- Provides placeholders for values, making it easy to replace with real configurations.
- Works with both Unix-like and Windows systems.

## Supported File Types

- `.env`: Regualr .env files
- `app.yaml`: Sample google app engine YAML configuration file for application settings

## Usage

To use the script, follow these steps:

1.  Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/sample-file-generator.git
    cd sample-file-generator

    ```

2.  Run the script with the desired file type and destination folder:

    ```bash
    ./main.sh path/to/your/file.ext path/to/destination
    Replace file.ext with the name of the file you want to generate (e.g., app.yaml), and destination with the folder where you want to save the generated file. Note, destination path is optional
    ```

3.  The script will determine the file type based on the filename and generate a sample file in the specified destination folder.
    Example; Suppose you want to generate a sample `app.yaml` file for environment variables.
    You can run the script as follows:

    ```bash
    ./main.sh path/to/app.yaml path/to/destination
    ```

    The script will create a sample_app.yaml file in the specified destination folder for generated file. If no destination path is provided, the generated file will be located in /generated-files
    Note: Make sure the source has the exact file name as mentioned in "Supported File Types"

## Structure

```
project-root/
├── main.sh
├── generated-files/
└── scripts/
    ├── generate_env.sh
    └── generate_app_yaml.sh
```

## Contributing

If you'd like to contribute to this project or report issues, no contribution guidelines yet.

### Adding support for file type

if you want to add support for another file type

1. add your script in /scripts taking in FILE_PATH and DESTINATION (optional)
2. add another case for the file

## Project Goal

Extend support various kinds of dotfiles

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
