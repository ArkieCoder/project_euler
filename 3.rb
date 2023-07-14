#!/usr/bin/env ruby

require 'prime'
require 'pp'

# Find the largest prime factor of 600851475143

# perhaps this is cheating - but no need to rewrite
# an algorithm if there is a perfectly good one
# available

def main
  n = 600_851_475_143
  result = Prime.prime_division(n).map {|a| a[0]}.sort.last
  puts "The largest prime factor of #{n} is #{result}"
end

main
