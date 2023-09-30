#!/bin/bash

hostname=$1

ping -c 20 -s 1000 $hostname | grep -oP '\d+(?=% packet loss)'
