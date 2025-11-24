FROM	debian:bullseye
RUN	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server netcat
COPY	./mariadb_conf.sh /mariadb_conf.sh
RUN chmod +x /mariadb_conf.sh
ENTRYPOINT ["./mariadb_conf.sh"]
