FROM alpine:3.12

#Install packages
RUN apk update && apk add openssl curl ca-certificates libc6-compat  openrc nginx openssh && openrc reboot
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.3_linux_amd64.tar.gz \
    && tar -xzvf telegraf-1.16.3_linux_amd64.tar.gz && rm telegraf-1.16.3_linux_amd64.tar.gz \
    && mv telegraf-1.16.3 telegraf

#Create Directory to excute nginx
RUN mkdir /run/nginx

RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
#Key & Certs
RUN mkdir -p /etc/ssl/
WORKDIR /etc/ssl
RUN mkdir -p private
RUN mkdir -p certs/
COPY nginx-selfsigned.key /etc/ssl/private/nginx.key
COPY nginx-selfsigned.crt /etc/ssl/certs/nginx.crt
COPY telegraf.conf /telegraf.conf
COPY prob.sh /prob.sh

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
CMD /tmp/start.sh
RUN touch /tst
