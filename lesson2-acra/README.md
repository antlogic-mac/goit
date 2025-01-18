# Acra examples

This folder contains docker files, scripts and instructions for working with Acra. Each subfolder includes it's own `README.md` explaining the folder contents.

## What is Acra

Acra is a sort of database proxy server which receives connection from the client(s) and routes it to the database, encrypting the fields.
So this achieves three main goals:
- database server is not exposed to the external network so possible attacker cannot exploit possible database vulnerabilities
- all confidential data is stored in the database encrypted
- all database access could be logged

## Main steps for Acra server setup

It is recommended to split learning of the subject to the following steps:
- TLS certificate generation: this is needed to setup secure connection between the client, Acra server and database server.
- Acra key generation: there is a bunch of key types so this is needed to understand what keys are used and for which purpose they are used.
- MySQL server setup: TLS certificate configuration.
- Acra server setup: server configuration, database encryption configuration, etc.
- Finally, docker-compose setup allowing to run all the previous steps together.

## Contents

- `certificates`: contains scripts for certificate generation and generated sample certificates as well.
- `acra-keymaker`: contains examples for Acra key generation.
- `mysql-server`: contains example for the MySQL server setup, including TLS certificate configuration.
- `acra-server`: contains example for the Acra server, including configuration based on contents of `certificates`, `acra-keymaker` and `mysql-server`.
