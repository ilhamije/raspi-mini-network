#!/bin/sh
for i in 1 10 100
do
  echo "Looping ... c = $i"
#   siege 192.168.1.11:5001 -c $i -t 2m -l > logs/be-concurrent-$i.json
#   siege 192.168.1.13 -c $i -t 2m -l > logs/lb-concurrent-$i.json
  siege 192.168.1.13:5003 -c $i -t 2m -l > logs/fe-concurrent-$i.json
done