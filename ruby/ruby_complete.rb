#!/usr/bin/env ruby

require 'csv'

age_count = Hash.new(0)

CSV.foreach(ARGV[0]) {|row|
  age_count[row[1].to_i] += 1
}

age_count.each {|age,count|
  puts [age, count].to_csv
}
