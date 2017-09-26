#!/bin/bash

# Install Java SDK
sudo yum install -y java-sdk

# Install wget to grab Tomcat
sudo yum install -y wget

# Install and setup Tomcat 9
sudo groupadd tomcat
sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
wget http://mirrors.ocf.berkeley.edu/apache/tomcat/tomcat-9/v9.0.0.M26/bin/apache-tomcat-9.0.0.M26.tar.gz
sudo mkdir /opt/tomcat
sudo tar xvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/

sudo cp /vagrant/tomcat.service /etc/systemd/system/tomcat.service

# Start Tomcat and verify status
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl status tomcat