#!/bin/bash

TARGET_HOST=$1

function check_exitcode () {
	if [ $? -ne 0 ]; then
	echo -e "Then exit code of the previous command is not successful\nRecived:\t$?\tExcepted:\t0"
	fi
}

function ping_host () {
	ping -c 5 $1 &>/dev/null
	return $?  
}

function check_execution () {
while true; do
	 ps -ef | grep -v grep | grep "ping -c 5 $TARGET_HOST" &>/dev/null 
	 if [ $? -eq 1 ]; then 
		echo "Ping has finished it's execution"
	  	break
	 else 
		echo "ping is still running"
		sleep 1	
	 fi
done
return 0
}

ping_host $TARGET_HOST
check_exitcode
check_execution $TARGET_HOST
check_exitcode

exit $?
