#!/bin/bash

if [ ! -f apache-maven-3.3.3-bin.tar.gz ] ; then
	wget ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
	tar -xvzf apache-maven-3.3.3-bin.tar.gz
fi

ln -s /vagrant/settings.xml /home/vagrant/.m2/settings.xml

cat << EOF > /etc/profile.d/exports.sh
export JAVA_HOME=$(eval dirname $(eval dirname $(eval "readlink -f /usr/bin/java")))
export M2_HOME=/home/vagrant/apache-maven-3.3.3
export PATH=$M2_HOME/bin:$JAVA_HOME:$PATH
EOF

