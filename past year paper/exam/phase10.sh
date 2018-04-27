#!/bin/bash

rm -f phase10.txt
awk -F"," '{print $2}' phase9.txt | sort >> phase10.txt

