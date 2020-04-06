FROM nginx:1.17.8-alpine

RUN apk add --no-cache bash openssl dos2unix

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www

RUN rm /etc/nginx/conf.d/default.conf
run rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx.tmpl /etc/nginx/conf.d
RUN ls /etc/nginx/conf.d/

CMD ["dockerize", "-template", "/etc/nginx/conf.d/nginx.tmpl:/etc/nginx/conf.d/nginx.conf", "nginx", "-g", "daemon off;"]
~                                                                                                                          
