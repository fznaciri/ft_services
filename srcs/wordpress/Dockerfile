FROM alpine:3.12

#install packages
RUN apk update && apk add nginx php7 php7-fpm php7-gd php7-curl php7-mcrypt php-mysqli php7-opcache wget tar openrc && openrc reboot
# telegraf --update-cache --repository http://git.alpinelinux.org/aports/tree/community/telegraf?h=master --allow-untrusted

RUN apk add php7-common php7-iconv php7-json php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

#Create Directory to excute nginx
RUN mkdir /run/nginx
RUN mkdir -p /etc/telegraf

WORKDIR /var/www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN chown 777 /var/www 

#ADD config file\
RUN mkdir -p /etc/nginx
COPY wp.crt /wp.crt
COPY wp.key /wp.key
COPY prob.sh /prob.sh
COPY site.conf /etc/nginx/conf.d/default.conf
COPY telegraf.conf /etc/telegraf
#COPY index.php /var/www
COPY wp-config.php /var/www/wordpress/wp-config.php
COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

EXPOSE 5050 

ENTRYPOINT [ "/tmp/start.sh" ]