#!/usr/bin/env bash

productUrl=$(docker exec -t php bash -c "php get_current_product_url.php")

echo "Current Product Url Suffix: ${productUrl}"
echo "php bin/magento app:config:import works..."
docker exec -t php bash -c "php bin/magento app:config:import"

newProductUrl="blah"

echo "now updating product_url_suffix to ${newProductUrl}"
docker exec -t php bash -c "sed -i \"s/'product_url_suffix' =>.*/'product_url_suffix' => '${newProductUrl}',/\" app/etc/config.php"
docker exec -t php bash -c "php bin/magento app:config:import"

echo "confirming that undoing this change 'fixes' the issue:"
docker exec -t php bash -c "sed -i \"s/'product_url_suffix' =>.*/'product_url_suffix' => '${productUrl}',/\" app/etc/config.php"
docker exec -t php bash -c "php bin/magento app:config:import"