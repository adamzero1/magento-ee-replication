#!/usr/bin/env bash

docker-compose up --build -d \
    && docker exec -t php bash -c "composer install -o --no-dev" \
    && docker exec -t php bash -c "chmod -R a+rw ." \
    && docker exec -t php bash -c "mv app/etc/env.php.build-dist app/etc/env.php" \
    && echo "Setup Complete"


