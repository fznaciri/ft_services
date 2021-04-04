FROM alpine:3.12

#install packages
RUN apk update && apk add nginx php7 php7-fpm php7-gd php7-curl php7-mcrypt php-mysqli php7-opcache wget tar libc6-compat openrc && openrc reboot

RUN apk add php7-common php7-iconv php7-json php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz \
    && tar -xzvf telegraf-1.16.3_linux_amd64.tar.gz && rm telegraf-1.16.3_linux_amd64.tar.gz \
    && mv telegraf-1.16.3 telegraf
#Create Directory to excute nginx
RUN mkdir /run/nginx

WORKDIR /var/www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN chown 777 /var/www 

#ADD config file\
RUN mkdir -p /etc/nginx
COPY prob.sh /prob.sh
COPY site.conf /etc/nginx/conf.d/default.conf
COPY telegraf.conf /telegraf.conf
COPY wp-config.php /var/www/wordpress/wp-config.php
COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

EXPOSE 5050 

ENTRYPOINT [ "/tmp/start.sh" ]