#!/bin/sh

# Go into ./data subfolder so all the stuff will be stored there for clarity.
cd "data" || exit

# Generate sample authority private key and then certificate. All other certificates will be signed by authority.
# The simplest way to understand in details what's going on in this command would be to ask ChatGPT: "What is going on in the following shell command: (command)"
openssl genpkey -algorithm ed25519 -out ca.key
openssl req -x509 -new -nodes -key ca.key -days 1826 -out ca.crt -subj '/C=UA/ST=Kyiv/L=Kyiv/O=Goit/OU=IT/CN=Test CA Cert' -addext "subjectAltName = DNS:localhost"

# Generate private key and certificate for the acra-client.
openssl genpkey -algorithm ed25519 -out acra-client.key
# This command would generate certificate signing request, as certificate must be signed with the authority key.
openssl req -new -nodes -key acra-client.key -out acra-client.csr -subj "/C=UA/ST=Kyiv/L=Kyiv/O=Goit/OU=IT/CN=Test Node Cert (acra-client)"
# This command puts some configuration options into the acra-client.v3.ext file to be utilized by the next command. EOF is used as marker for the text start an end.
# DNS.2 contains name of the server (in real life it would be the server's name, i.e. www.something.com)
cat > acra-client.v3.ext << EOF
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
DNS.2 = acra-client
EOF
# This command finally generates the certificate, using the CA key as the signer.
openssl x509 -req -in acra-client.csr -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -out acra-client.crt -days 730 -extfile acra-client.v3.ext

# Generate private key and certificate for the acra-server. Similar to the previous command but with some additional configuration options.
# For some reason it includes certificate revocation lists (CRL) reference, but I doubt that we'll make use of it in any way.
# Please note that we do not enter password anywhere - all keys generated here are not encrypted. As this is a sample script for educational use.
openssl genpkey -algorithm ed25519 -out acra-server.key
openssl req -new -nodes -key acra-server.key -out acra-server.crt -subj "/C=UA/ST=Kyiv/L=Kyiv/O=Goit/OU=IT/CN=Test Node Cert (acra-server)"
cat > acra-server.v3.ext << EOF
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment
subjectAltName = @alt_names
authorityInfoAccess = OCSP;URI:http://127.0.0.1:8888
crlDistributionPoints=crldp1_section

[crldp1_section]
fullname=URI:http://127.0.0.1:8889/crl.pem

[alt_names]
DNS.1 = localhost
DNS.2 = acra-server
EOF
openssl x509 -req -in acra-server.crt -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -out acra-server.crt -days 730 -extfile acra-server.v3.ext

# Now we will generate private key and certificate for the MySql (MariaDB) server
openssl genpkey -algorithm ed25519 -out mysql.key
openssl req -new -nodes -key mysql.key -out mysql.csr -subj "/C=UA/ST=Kyiv/L=Kyiv/O=Goit/OU=IT/CN=Test Node Cert (mysql)"
cat > mysql.v3.ext << EOF
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
DNS.2 = mysql
EOF
openssl x509 -req -in mysql.csr -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -out mysql.crt -days 730 -extfile mysql.v3.ext

# Cleanup to not make a mess: csr and ext files are temporary ones
rm ./*.ext ./*.csr

# Go back to the parent folder
cd ..

# Good for now
# What we have afterwards:
# - bunch of .key files - those are private keys for the certificates.
# - bunch of .crt files - those are certificates themselves, i.e. things which binds certain data to the public key, signed with CA key.
# You may investigate contents of the previous files via the `openssl asn1parse -in filename.ext` command.
# - ca.srl - certificate authorithy serial number, see why it is needed here: https://stackoverflow.com/a/66357989/452752
# You may check it's value via `cat ca.srl` command