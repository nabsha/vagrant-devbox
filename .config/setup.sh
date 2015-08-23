#!/bin/bash

if [ ! -f /tmp/apache-maven-3.3.3-bin.tar.gz ] ; then
	wget -O /tmp/apache-maven-3.3.3-bin.tar.gz ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
fi

if [ ! -d tooools/apache-maven-3.3.3 ] ; then
	mkdir -p tooools
	tar -xvzf /tmp/apache-maven-3.3.3-bin.tar.gz -C tooools/
fi

ln -sf /vagrant/.config/settings.xml /home/vagrant/.m2/settings.xml

cat << EOF > /etc/profile.d/exports.sh
export JAVA_HOME=$(eval dirname $(eval dirname $(eval "readlink -f /usr/bin/java")))
export M2_HOME=/home/vagrant/tooools/apache-maven-3.3.3
export PATH=$M2_HOME/bin:$JAVA_HOME:$PATH
EOF

