# CyberLAB Command Repeater

## Overview

The CyberLAB Command Repeater is a Bash script that allows users to execute a specified command multiple times with optional sequential numbering. This tool is particularly useful for tasks requiring repeated execution of a command with slight variations, such as creating sequentially numbered files or running a process multiple times with different output names.

## Features

- **Command Input**: Prompts for a user-specified command to repeat.
- **Iteration Control**: Allows users to set the number of repetitions.
- **Sequential Numbering**: Supports a `{{sequence}}` placeholder in commands for automatic numbering.
- **Error Handling**: Detects command failures and offers retry options.
- **Execution Feedback**: Provides real-time progress updates.
- **Confirmation Checks**: Ensures intentional usage when `{{sequence}}` is omitted.

## Usage

1. Run the script: `./command_repeater.sh`
2. Enter the command you want to repeat. Use `{{sequence}}` where you want a sequential number.
3. Specify the number of times to repeat the command.
4. The script will execute the command, replacing `{{sequence}}` with incrementing numbers.

## Example

To create 5 sequentially numbered empty files:

1. Run the script
2. Enter command: `touch test_file_{{sequence}}.txt`
3. Enter number of repetitions: `5`

This will create files: `test_file_1.txt`, `test_file_2.txt`, ..., `test_file_5.txt`

## Note

Ensure the script has execute permissions: `chmod +x command_repeater.sh`
