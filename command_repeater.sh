#!/bin/bash

# Display welcome message
echo "Welcome to the CyberLAB Command Repeater. Please follow the prompts."

# Prompt user for the command to run
read -p "Enter the command you want to run (use {{sequence}} for sequential numbering): " user_command

# Check if the command includes the {{sequence}} placeholder
if [[ "$user_command" != *"{{sequence}}"* ]]; then
    # If not, ask for confirmation
    read -p "Your command doesn't include {{sequence}}. Are you sure you want to continue? (y/n): " confirm
    if [[ $confirm != [Yy]* ]]; then
        echo "Exiting the script."
        exit 0
    fi
fi

# Prompt user for the number of repetitions
read -p "How many times would you like it to run? " repeat_count

# Validate that the input is a number
if ! [[ "$repeat_count" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

# Loop to execute the command the specified number of times
for ((i=1; i<=repeat_count; i++))
do
    # Replace {{sequence}} with the current iteration number
    current_command="${user_command//\{\{sequence\}\}/$i}"
    
    # Display the command being executed
    echo "Running command (Iteration $i of $repeat_count): $current_command"
    
    # Execute the command and wait for it to complete
    eval "$current_command"
    command_exit_status=$?
    
    # Check if the command failed
    if [ $command_exit_status -ne 0 ]; then
        echo "Command failed with exit status $command_exit_status."
        read -p "Do you want to retry? (y/n): " retry
        if [[ $retry == [Yy]* ]]; then
            # Decrement counter to retry the same iteration
            ((i--))
            continue
        fi
    else
        echo "Command completed successfully."
    fi
    
    # Separator for readability
    echo "------------------------"
done

# Completion message
echo "Command execution completed."
