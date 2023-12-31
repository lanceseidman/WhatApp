#!/bin/bash

## WhatApp is written by Lance Seidman
##
## This is to find the exact applications being used and ports in an easily to understand format
##
## Last Updated: 12/31/2023

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root to see program names"
  exit
fi

# Display active network connections with program names
echo "Active Network Connections:"
netstat -tunap | grep ESTABLISHED | awk '{split($7, a, "/"); split($4, b, ":"); if (length(a[2]) > 0) print "Application:", a[2], "is using Port:", b[2];}' | grep -v '127.0.0.1\|::1'

echo ""
echo "Foreign Network Connections:"
netstat -tunap | grep ESTABLISHED | awk '{split($7, a, "/"); split($4, b, ":"); if (length(a[2]) > 0) print "Application:", a[2], "is using Port:", b[2];}' | grep -v '127.0.0.1\|::1'

echo ""
echo "Have a Nice Day!"
