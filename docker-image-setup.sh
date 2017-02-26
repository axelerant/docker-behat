#!/usr/bin/env bash

echo "---Updating package list---"
apt-get -qq update >> /var/log/setup.log

echo "---Installing some base packages---"
apt-get -y install unzip vim curl build-essential python-software-properties git >> /var/log/setup.log 2>&1

echo "---Installing PHP, associated packages and PHP module for httpd server---"
apt-get -y install php libapache2-mod-php php-curl php-gd php-mysql php-gettext >> /var/log/setup.log 2>&1

echo "---Installing drush---"
apt-get -y install drush >> /var/log/setup.log 2>&1

echo "---Install composer---"
if [ ! -f /usr/local/bin/composer ]; then
  curl --silent https://getcomposer.org/installer | php >> /var/log/setup.log 2>&1
  mv composer.phar /usr/local/bin/composer
fi

echo "---Install phantomjs---"
apt-get -y install libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev phantomjs >> /var/log/setup.log 2>&1

echo "---Start phantomjs---"
cd /tmp; export QT_QPA_PLATFORM=offscreen; nohup phantomjs --webdriver=4444 &

