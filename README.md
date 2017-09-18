## Vagrant Environment
- Using CentOS 7.3.1611 to match an available DigitalOcean image
	- `vagrant init`
	- Update `Vagrantfile` to include
    `config.vm.box = "centos/7"`
    `config.vm.box_version = "1611.01"`
   - `vagrant up`
   - `vagrant ssh`
   - See https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-centos-7
   - `sudo yum install java-sdk`
   - `sudo groupadd tomcat`
   - `sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat`
   - `sudo yum install wget`
   - `wget http://mirrors.ocf.berkeley.edu/apache/tomcat/tomcat-9/v9.0.0.M26/bin/apache-tomcat-9.0.0.M26.tar.gz`
   - `sudo mkdir /opt/tomcat`
   - `sudo tar xvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1`
   - `cd /opt/tomcat`
   - `sudo chgrp -R tomcat /opt/tomcat`
   - `sudo chmod -R g+r conf`
   - `sudo chmod g+x conf`
   - `sudo chown -R tomcat webapps/ work/ temp/ logs/`
   - `sudo vi /etc/systemd/system/tomcat.service`
   - Paste: 
		\# Systemd unit file for tomcat
		[Unit]
		Description=Apache Tomcat Web Application Container
		After=syslog.target network.target
		
		[Service]
		Type=forking
		
		Environment=JAVA_HOME=/usr/lib/jvm/jre
		Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
		Environment=CATALINA_HOME=/opt/tomcat
		Environment=CATALINA_BASE=/opt/tomcat
		Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
		Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'
		
		ExecStart=/opt/tomcat/bin/startup.sh
		ExecStop=/bin/kill -15 $MAINPID
		
		User=tomcat
		Group=tomcat
		UMask=0007
		RestartSec=10
		Restart=always
		
		[Install]
		WantedBy=multi-user.target
	- `sudo systemctl daemon-reload`