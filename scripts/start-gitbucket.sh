#!/bin/sh

GITHOME=/home/git
CACERT="$GITHOME/cacerts"

#Generate keystore if not existent
if [ ! -f $CACERT ]; then
	cd $GITHOME
	date +%s | sha256sum | base64 | head -c 32 > tmp.pass
	#Not good to figure a better way
	wget "http://www.cacert.org/certs/root.crt" "http://www.cacert.org/certs/class3.crt" 
	yes | keytool -import -storepass tmp.pass -file root.crt -alias cacert-root -trustcacerts -keystore ${CACERT}
 	yes | keytool -import -storepass tmp.pass -file class3.crt -alias cacert-class3 -trustcacerts -keystore ${CACERT}   
	rm tmp.pass root.crt class3.crt
fi

#Start gitbucket with good keystore
java -jar /opt/gitbucket.war --gitbucket.home=${GITHOME} --port=80 --prefix=/ -Djavax.net.ssl.trustStore=${CACERT}
