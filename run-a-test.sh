#!/bin/bash

# HOW TO USE THIS SCRIPT
# 1. Fiddle with test.sh until you're happy
# 2. cd into the folder you want the data to be saved in
# 3. Run ../run-a-test.sh (or however you can get to it)

cd ~/engg_533
./test.sh

cd -
cp ~/engg_533/responsetimes/*.txt .

ssh 192.168.6.210 cat ~/engg_533/collectl/perfdata.txt > ./perfdata.txt
ssh 192.168.6.210 cat ~/engg_533/collectl/netdata.txt > ./netdata.txt

ssh 192.168.6.210 "~/engg_533/collectl/utilization.sh ~/engg_533/collectl/perfdata.txt" > ./utilization.txt

