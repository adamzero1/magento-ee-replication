#!/usr/bin/env bash

docker-compose up --build -d \
    && docker exec -t php bash -c "composer install -o --no-dev" \
    && docker exec -t php bash -c "php bin/magento setup:install --db-host=db --db-name=magento --db-user=magento --db-password=password --admin-user=admin --admin-password=Password123456 --admin-firstname=admin --admin-lastname=admin --admin-email=admin@admin.com" \
    && docker exec -t php bash -c "php bin/magento app:config:dump" \
    && docker exec -t php bash -c "chmod -R a+rw ." \
    && echo "Setup Complete"


