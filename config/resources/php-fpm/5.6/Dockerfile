FROM debian:jessie

RUN apt-get update
RUN apt-get install -y php5-common 
RUN apt-get install -y php5-cli 
RUN apt-get install -y php5-fpm 
RUN apt-get install -y php5-mcrypt 
RUN apt-get install -y php5-mysql 
RUN apt-get install -y php5-sqlite 
RUN apt-get install -y php5-apcu 
RUN apt-get install -y php5-gd 
RUN apt-get install -y php5-imagick 
RUN apt-get install -y php5-curl 
RUN apt-get install -y php5-intl 
RUN apt-get install -y php5-xdebug
RUN apt-get install -y vim

# Add all config files
ADD config/mysymfonyapp-php.ini /etc/php5/fpm/conf.d/
ADD config/mysymfonyapp-php.ini /etc/php5/cli/conf.d/
ADD config/xdebug.ini /etc/php5/mods-available/
ADD config/mysymfonyapp-php.pool.conf /etc/php5/fpm/pool.d/

# Add bashrc with useful aliases
ADD config/bashrc /root/.bashrc

# Change the uid of www-data
RUN usermod -u 1000 www-data

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN mv composer.phar /usr/bin/composer

# Make sure that xdebug is off
RUN php5dismod xdebug

CMD ["php5-fpm", "-F"]

EXPOSE 9000