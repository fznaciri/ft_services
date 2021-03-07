FROM alpine:latest

#Install packages
RUN apk update && apk add openssl curl ca-certificates
RUN apk add nginx

#Intsall SSH
RUN apk add --no-cache openssh

#Create Directory to excute nginx
RUN mkdir /run/nginx

#Key & Certs
RUN mkdir -p /etc/ssl/
WORKDIR /etc/ssl
RUN mkdir -p private
RUN mkdir -p certs/
COPY nginx-selfsigned.key /etc/ssl/private/nginx.key
COPY nginx-selfsigned.crt /etc/ssl/certs/nginx.crt


RUN adduser -D user
RUN echo "user:123456"|chpasswd
RUN ssh-keygen -A

#ADD config file
RUN mkdir -p /etc/nginx/
COPY site.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www

#Expose Ports
EXPOSE 80
EXPOSE 443
EXPOSE 22

#Default CMD
COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
CMD ["/tmp/start.sh"]