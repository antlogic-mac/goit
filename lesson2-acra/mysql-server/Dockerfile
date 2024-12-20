# JFYI: MariaDB is a fork of MySQL, made after Oracle's acquisition of MySQL
FROM mariadb:11.6.2

# Copy certificates to the Docker image. See the certificates subfolder on how those certificates are generated.
COPY /certificates/data/mysql.crt /certs/mysql.crt
COPY /certificates/data/mysql.key /certs/mysql.key
COPY /certificates/data/ca.crt /certs/ca.crt
# Change permissions for the certificate folder and private key
RUN chown -R mysql:mysql /certs && chmod 0400 /certs/mysql.key
# Put the TLS/SSL configuration file into the appropriate location
COPY /mysql-server/mariadb-ssl.cnf /etc/mysql/mariadb.conf.d/