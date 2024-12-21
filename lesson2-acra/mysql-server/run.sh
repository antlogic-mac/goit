#! /bin/sh
# Run a Docker container with mysql server, configured to be accessible by acra-server

docker run -it \
  -p 3306:3306 \
  -e MYSQL_RANDOM_ROOT_PASSWORD="yes" \
  -e MYSQL_USER=acra_test \
  -e MYSQL_PASSWORD=password \
  -e MYSQL_DATABASE=acra_test_db \
  mysql-server-acra-image
