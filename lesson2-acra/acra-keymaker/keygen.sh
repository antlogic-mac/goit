#!/bin/sh
# Generate acra keys inside of the acra-keymaker container.
# Would be copied to the local filesystem via the attached volume /keys

# Cleanup the keys directory
rm -rf /keys/*
# Set correct permissions for the folder
chmod 700 /keys
# Generate the master key
acra-keymaker --keystore=v1 --generate_master_key=/keys/master.key
# Put it base64-encoded into the environment variable
ACRA_MASTER_KEY="$(base64 < /keys/master.key)"
export ACRA_MASTER_KEY
# Generate all sorts of keys for the client Charlie
acra-keymaker --client_id=charlie --keys_output_dir=/keys --keys_public_output_dir=/keys