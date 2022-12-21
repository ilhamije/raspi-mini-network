#!/bin/sh

FRONTEND_IPADDR=""


for i in 2 10 100
do
  echo "direct hit from frontend to backend"
  siege $FRONTEND_IPADDR:5003 -c -$i -r 300 -t 2m -l > logs/fe-concurrent-$i-directbackend.json

  echo "Process .. c = $i"
  # echo "lbmethod=bytraffic"
  # siege 192.168.1.11:5001 -c $i -t 2m -l > logs/be-concurrent-$i-bytraffic.json
  # siege 192.168.1.13 -c $i -t 2m -l > logs/lb-concurrent-$i-bytraffic.json
  # siege 192.168.1.13:5003 -c $i -t 2m -l > logs/fe-concurrent-$i-bytraffic.json

  echo "lbmethod=byrequests"
  # siege 192.168.1.17 -c $i -t 2m -l > logs/lb-concurrent-$i-byrequests.json
  # siege 192.168.1.17:5003 -c $i -t 2m -l > logs/fe-concurrent-$i-byrequests.json
  # siege 192.168.1.15:5001 -c $i -t 2m -l > logs/be-concurrent-$i-byrequests.json

  echo "lbmethod=bybusyness"
  # siege 192.168.1.17 -c $i -t 2m -l > logs/lb-concurrent-$i-bybusyness.json
  # siege 192.168.1.17:5003 -c $i -t 2m -l > logs/fe-concurrent-$i-bybusyness.json
  # siege 192.168.1.15:5001 -c $i -t 2m -l > logs/be-concurrent-$i-bybusyness.json

done