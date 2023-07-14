#!/usr/bin/env ruby

# 91 x 99 = 9009 which is the largest numeric
# palindrome made by multiplying two two-digit
# numbers together.  What is the largest numeric
# palindrome made by multiple two three-digit
# numbers together?

require 'pp'

def is_palindrome?(n)
  n.to_s.reverse == n.to_s
end

def main
  result = 100.upto(999).map{ |a|
    100.upto(999).map{ |b|
      [a, b, a*b]
    }
  }.flatten(1)
  .select { |n| is_palindrome?(n[2]) }
  .sort { |a,b| a[2] <=> b[2] }
  .last

  puts "The largest palindrome made by multiplying two"
  puts "three-digit numbers together is:"
  puts result[2]
  puts ".. created by multiplying #{result[0]} and #{result[1]}"
end
main
