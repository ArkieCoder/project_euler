#!/usr/bin/env ruby

require 'pp'

limit = ARGV[0].to_i
# Find the index of the first number in the fibonacci sequence that has 1k digits

def fib_array(a)
  fib = [1,1]
  if a > 2
    (a-2).times {
      fib.push fib[-1] + fib[-2]
    }
  end
  fib
end

def main(limit)
  result = fib_array(limit)
    .each_with_index
    .map { |x,i| [x,i]}
    .select { |a| a[0].to_s.length == 1000} 
    .first
  puts "The first fibonacci # to have 1000 digits is at index #{result[1]+1}"
  puts "The number is:"
  puts result[0]
end

main(limit)
