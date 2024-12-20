# Certificates generation and storage for out services.

This folder contains script to generate certificates and sample certificates (which would be overwriten once you run `certgen`).

## Contents

- `certgen.sh`: Shell script which would call `openssl` and generate all the required certificaets, saving them in `data` subfolder, overwriting the existing ones.
