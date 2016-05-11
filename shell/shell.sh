#!/bin/sh

cut -f 2 -d , ./input/sample.csv | sort | uniq -c |  awk '{print $2","$1}'
