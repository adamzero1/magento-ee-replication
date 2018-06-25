FROM ubuntu:xenial

RUN apt-get update -qq
RUN apt-get -y install php-cli php-gd php-mcrypt php-intl php-soap php-mbstring php-zip curl php-curl php-mysql php-xml php-bcmath \
    && apt-get clean

RUN php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');"; \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php; \
    php -r "unlink('composer-setup.php');"; \
    mv composer.phar /usr/bin/composer; \
    chmod a+x /usr/bin/composer;

ENTRYPOINT ["bash", "-c", "tail -f /etc/hosts"]