FROM mysql:8.1

###############
# SETUP MYSQL #
###############
RUN mkdir -p /var/run/mysql && chown mysql:mysql /var/run/mysqld
ADD conf.d /etc/mysql/conf.d
