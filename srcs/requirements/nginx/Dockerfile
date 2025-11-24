FROM	debian:bullseye
RUN	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y nginx openssl && \
	mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout	/etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=nleoni.42.fr/UID=First" && \
	mkdir -p /var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress
COPY ./nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
