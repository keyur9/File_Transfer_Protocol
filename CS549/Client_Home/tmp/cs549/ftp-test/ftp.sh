#!/bin/bash
export JARFILE=/home/keyur/CS549/Client_Home/tmp/cs549/ftp-test/ftp.jar
export POLICY=/home/keyur/CS549/Client_Home/tmp/cs549/ftp-test/client.policy

if [ ! -e $JARFILE ] ; then
	echo "Missing jar file: $JARFILE"
	echo "Please assemble the ftpclient jar file."
	exit
fi

if [ ! -e $POLICY ] ; then
	pushd /home/keyur/CS549/Client_Home/tmp/cs549/ftp-test
	jar xf "$JARFILE" client.policy
	popd
fi

echo "Running client"
echo "java -Djava.security.policy=$POLICY -jar $JARFILE"
java -Djava.security.policy=$POLICY -jar $JARFILE