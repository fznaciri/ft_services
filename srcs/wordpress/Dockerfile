FROM alpine:latest

#install packages
RUN apk update && apk add nginx php7 php7-fpm php7-gd php7-curl php7-mcrypt php-mysqli php7-opcache wget tar
RUN apk add php7-common php7-iconv php7-json php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
#Create Directory to excute nginx
RUN mkdir /run/nginx

WORKDIR /var/www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN chown 777 /var/www 
#ADD config file\
RUN mkdir -p /etc/nginx/
COPY site.conf /etc/nginx/conf.d/default.conf
#COPY index.php /var/www
COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
ENTRYPOINT [ "/tmp/start.sh" ]