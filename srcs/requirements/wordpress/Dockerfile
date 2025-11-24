FROM	debian:bullseye
RUN	apt-get update && apt-get upgrade -y && \
	mkdir -p /run/php && \
	apt-get install -y curl php php7.4-fpm php-mysql mariadb-client
COPY	./wordpress_conf.sh /
RUN	chmod +x wordpress_conf.sh
ENTRYPOINT ["./wordpress_conf.sh"]
