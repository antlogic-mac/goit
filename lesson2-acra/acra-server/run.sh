#! /bin/sh
# Run a Docker container with acra-server, mounting all the required folders and specifying all the required parameters.

docker run -it \
  -v "$(pwd)/../acra-keymaker/keys:/keys" \
  -v "$(pwd)/../certificates/data:/certificates" \
  -v "$(pwd)/config:/config" \
  -v "$(pwd)/data:/data" \
  -p 9393:9393 \
  --network acra \
  acra-server-image \
  --token_db=/data/token.db \
  --keys_dir=/data/acra-server \
  --http_api_enable \
  --tls_auth=4 \
  --tls_ca=/certificates/ca.crt \
  --tls_cert=/certificates/acra-server.crt \
  --tls_key=/certificates/acra-server.key \
  --tls_client_id_from_cert \
  --tls_identifier_extractor_type=distinguished_name \
  --incoming_connection_api_string=tcp://0.0.0.0:9090 \
  --incoming_connection_string=tcp://0.0.0.0:9393 \
  --v \
  --tls_ocsp_from_cert=ignore \
  --tls_crl_from_cert=ignore \
  --config_file=/config/acra-server.yaml