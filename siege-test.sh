#!/bin/sh
for i in 1 10 100
do
  echo "Process .. c = $i"
  # echo "lbmethod=bytraffic"
  # siege 192.168.1.11:5001 -c $i -t 2m -l > logs/be-concurrent-$i.json
  # siege 192.168.1.13 -c $i -t 2m -l > logs/lb-concurrent-$i.json
  # siege 192.168.1.13:5003 -c $i -t 2m -l > logs/fe-concurrent-$i.json

  # echo "lbmethod=byrequests"
  # siege 192.168.1.17 -c $i -t 2m -l > logs/lb-concurrent-$i-byrequests.json
  # siege 192.168.1.17:5003 -c $i -t 2m -l > logs/fe-concurrent-$i-byrequests.json
  # siege 192.168.1.15:5001 -c $i -t 2m -l > logs/be-concurrent-$i-byrequests.json

  # echo "lbmethod=bybusyness"
  # siege 192.168.1.17 -c $i -t 2m -l > logs/lb-concurrent-$i-bybusyness.json
  # siege 192.168.1.17:5003 -c $i -t 2m -l > logs/fe-concurrent-$i-bybusyness.json
  # siege 192.168.1.15:5001 -c $i -t 2m -l > logs/be-concurrent-$i-bybusyness.json


  echo "direct hit from frontend to backend"
  siege 192.168.1.17:5003 -c $i -t 2m -l > logs/fe-concurrent-$i-directbackend.json
done