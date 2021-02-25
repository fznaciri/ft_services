FROM alpine

RUN apk update && apk add openssl curl ca-certificates bash
RUN curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
RUN openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout
RUN mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/
RUN mkdir /run/nginx
RUN apk add nginx

CMD ["nginx", "-g", "daemon off;"]