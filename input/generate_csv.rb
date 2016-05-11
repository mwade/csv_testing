#!/usr/bin/env ruby

CSV_ROWS      = 1_000_000
USER_ID_START = 1000
AGE_RANGE     = (13 .. 100) 

(1..CSV_ROWS).each {|i|
  puts [i + USER_ID_START, rand(AGE_RANGE)].join(',')
}
