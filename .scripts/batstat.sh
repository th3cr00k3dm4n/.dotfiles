#!/bin/bash

# Set the high and low battery thresholds (in percent)
high_battery_threshold=80
low_battery_threshold=25

# Set the check interval (in seconds)
check_interval=60

while true; do
  # Get the current battery level and status
  battery_level=$(acpi -b | awk '{print $4}' | tr -d ',')

  # Check if the battery level is above the high battery threshold
  if [ "$battery_level" -ge "$high_battery_threshold" ]; then
    # Send a notification
    notify-send "High Battery: $battery_level%"

  # Check if the battery level is below the low battery threshold
  elif [ "$battery_level" -le "$low_battery_threshold" ]; then
    # Send a notification
    notify-send "Low Battery: $battery_level%"
  fi

  # Sleep for the specified interval before checking again
  sleep "$check_interval"
done
