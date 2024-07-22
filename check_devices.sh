#!/bin/bash

# File containing device names
file="host.txt"

# SSH credentials
user="user"
password="password"

# Loop through each line in the file
while IFS= read -r device
do
  echo "Processing device: $device"  # Debugging information

  # Use sshpass to provide the password and run the command on the remote device
  output=$(sshpass -p "$password" ssh -n -o StrictHostKeyChecking=no "$user@$device" "python3 route_check.py")
  
  # Check if there is any output from the command
  if [ -n "$output" ]; then
    echo "Device with issue: $device"
  else
    echo "Device $device passed the route check."  # Debugging information
  fi

done < "$file"

