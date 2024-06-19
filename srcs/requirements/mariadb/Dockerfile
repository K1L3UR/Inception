FROM debian:bullseye

RUN apt update -y
RUN apt upgrade
RUN apt install vim -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mysql.sh scripts/mysql.sh

RUN chmod -R 755 /scripts

# ENTRYPOINT [ "/scripts/mysql.sh" ]