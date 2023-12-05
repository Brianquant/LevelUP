FROM mysql:8.0

###############
# SETUP MYSQL #
###############
RUN mkdir -p /var/run/mysql && chown mysql:mysql /var/run/mysqld
ADD conf.d /etc/mysql/conf.d

COPY init/setup.sql /docker-entrypoint-initdb.d/
