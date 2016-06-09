FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update
RUN apt-get install -y php7.0-fpm
RUN apt-get install -y php7.0-cli
RUN apt-get install -y php7.0-common
RUN apt-get install -y php7.0-json
RUN apt-get install -y php7.0-opcache
RUN apt-get install -y php7.0-mysql
RUN apt-get install -y php7.0-phpdbg
RUN apt-get install -y php7.0-mbstring
RUN apt-get install -y php7.0-gd
RUN apt-get install -y php7.0-imap
RUN apt-get install -y php7.0-ldap
RUN apt-get install -y php7.0-pspell
RUN apt-get install -y php7.0-recode
RUN apt-get install -y php7.0-tidy 
RUN apt-get install -y php7.0-dev 
RUN apt-get install -y php7.0-intl 
RUN apt-get install -y php7.0-gd 
RUN apt-get install -y php7.0-curl 
RUN apt-get install -y php7.0-zip 
RUN apt-get install -y php7.0-xml
RUN apt-get install -y php-xdebug

# Add all config files
ADD config/mysymfonyapp-php.ini /etc/php/7.0/fpm/conf.d/
ADD config/mysymfonyapp-php.ini /etc/php/7.0/cli/conf.d/
ADD config/xdebug.ini /etc/php/7.0/mods-available/
ADD config/mysymfonyapp-php.pool.conf /etc/php/7.0/fpm/pool.d/
RUN rm -rf /etc/php/7.0/fpm/pool.d/www.conf
RUN sed -i -- 's/pid =/; pid =/g' /etc/php/7.0/fpm/php-fpm.conf

# Add bashrc with useful aliases
ADD config/bashrc /root/.bashrc

# Change the uid of www-data
RUN usermod -u 1000 www-data

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN mv composer.phar /usr/bin/composer

EXPOSE 9000

CMD ["php-fpm7.0", "-F"]


