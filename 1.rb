#!/usr/bin/env ruby

limit = ARGV[0].to_i
# If we list all the natural numbers below 10
# that are multiples of 3 or 5, we get 3, 5, 6
# and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

# This script finds the sum of all multiples of 3 or 5
# up to the limit given on the command line.

def div_by?(x,n)
  x % n == 0
end

def main(limit)
  puts "Limit = #{limit}"
  puts (3..limit - 1).select{ |x|
    div_by_3 = div_by?(x,3)
    div_by_5 = div_by?(x,5)
    div_by_3 || div_by_5
  }.inject(&:+)
end

main(limit)
