FROM alpine:3.12

RUN apk update && apk add php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add nginx phpmyadmin wget tar libc6-compat openrc && openrc reboot
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz \
    && tar -xzvf telegraf-1.16.3_linux_amd64.tar.gz && rm telegraf-1.16.3_linux_amd64.tar.gz \
    && mv telegraf-1.16.3 telegraf
#Create Directory to excute nginx
RUN mkdir /run/nginx
#create a dir
RUN mkdir -p /usr/share/webapps/
#download the srcode
WORKDIR /usr/share/webapps/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
#unpack & remove the folder
RUN tar zxvf phpMyAdmin-5.1.0-english.tar.gz 
RUN rm phpMyAdmin-5.1.0-english.tar.gz
#rename the folder
RUN mv phpMyAdmin-5.1.0-english phpmyadmin
RUN chmod -R 777 /usr/share/webapps/phpmyadmin
COPY site.conf /etc/nginx/conf.d/default.conf
COPY config.inc.php ./phpmyadmin/config.inc.php
COPY telegraf.conf /telegraf.conf
COPY prob.sh /prob.sh
COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
EXPOSE 5000
ENTRYPOINT [ "/tmp/start.sh" ]