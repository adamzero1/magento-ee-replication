# magento-ee-replication

## Contents
- [magento app:config:import broken](#magento-appconfigimport-broken)
- [multi job deployment][#multi-job-deployment)
## magento app:config:import broken
https://support.magento.com/hc/en-us/requests/80551

Pre-requisites:
 1. docker installed
 2. docker-compose installed

1. clone
<pre>git clone https://github.com/adamzero1/magento-ee-replication.git ee-replication && cd ee-replication;</pre>

2. authentication, you need to update the contents of 'auth.json' to contain valid ee credentials

3. run the setup script
<pre>./setup.sh</pre>

4. run the test script
<pre>./test.sh</pre>
expected output is:
<pre>
Current Product Url Suffix: .html
php bin/magento app:config:import works...
Nothing to import.
now updating product_url_suffix to blah
Processing configurations data from configuration file...
Import failed: Invalid Base URL. Value must be a URL or one of placeholders: {{base_url}}
confirming that undoing this change 'fixes' the issue:
Nothing to import.
</pre>
