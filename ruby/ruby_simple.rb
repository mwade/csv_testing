#!/usr/bin/env ruby

age_count = Hash.new(0)

IO.foreach(ARGV[0]) {|line|
  row = line.split(',')

  user_id = row[0].to_i
  age = row[1].to_i

  age_count[age] += 1
}

age_count.each {|age,count|
  puts [age, count].join(',')
}
