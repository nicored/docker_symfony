FROM debian:jessie

RUN apt-get update
RUN apt-get install -y nginx

ADD config/nginx.conf /etc/nginx/

RUN ln -s /etc/nginx/sites-available/mysymfonyapp.conf /etc/nginx/sites-enabled/mysymfonyapp

RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
