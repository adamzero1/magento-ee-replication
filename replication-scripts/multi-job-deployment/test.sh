#!/usr/bin/env bash
echo "clearing pub/static";
docker exec -t php bash -c "rm -rf pub/static/*"

echo "running deploy (without specifying number of jobs)..."
docker exec -t php bash -c "php bin/magento setup:static-content:deploy --force --strategy=standard --area=frontend --theme=Magento/luma -- de_AT de_DE en_GB en_IE en_US fr_FR"


echo "clearing pub/static";
docker exec -t php bash -c "rm -rf pub/static/*"

echo "running deploy (specifying number of jobs)..."
docker exec -t php bash -c "php bin/magento setup:static-content:deploy --jobs=4 --force --strategy=standard --area=frontend --theme=Magento/luma -- de_AT de_DE en_GB en_IE en_US fr_FR"