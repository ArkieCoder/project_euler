#!/usr/bin/env ruby

# 2520 is the smallest number that can be divided
# by each of the numbers from 1 to 10 without any
# remainder.

# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

## This will take between 5-10 minutes to complete

max_num = ARGV[0].to_i

def is_divisible?(num, test_num)
  test_num % num == 0
end

def is_divisible_upto?(max_num, test_num)
  result = true
  1.upto(max_num).each { |x|
    result = is_divisible?(x, test_num)
    break if !result
  }
  result
end

def main(max_num)
  divisible_upto = 1
  1.upto(Float::INFINITY).each { |x|
    divisible_upto = x
    break if is_divisible_upto?(max_num, x)
    divisible_upto = 1
  }
  puts "#{divisible_upto} is the first number divisible by numbers 1 through #{max_num}"
end

main(max_num)
