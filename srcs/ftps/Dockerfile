FROM alpine:3.12

RUN apk update && apk --no-cache add vsftpd openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com"  -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

COPY vsftpd.conf etc/vsftpd/vsftpd.conf
COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

EXPOSE 21 10090-10093

ENTRYPOINT [ "/tmp/start.sh" ]