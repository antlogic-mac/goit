#!/bin/sh
# Entry point script for acra-server

# Check whether all required folders are properly mounted
for dir in "/keys" "/certificates" "/config"; do
  if [ ! -d "$dir" ]; then
    echo "Error: $dir does not exist. Check whether you mounted it properly."
    exit 1
  elif [ -z "$(ls -A "$dir")" ]; then
    echo "Error: directory $dir is empty. Check whether you mounted it properly."
    exit 1
  fi
done

# Change the permissions to required ones
chmod 700 /data
chmod 700 /data/acra-server

# Save master key to the environment variable
ACRA_MASTER_KEY="$(base64 < "/keys/master.key")"
export ACRA_MASTER_KEY

# Run acra-server itself, passing all the parameters to it
acra-server "$@"