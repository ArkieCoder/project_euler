#!/usr/bin/env ruby

def main
  sum_of_squares = (1..100).to_a.map{|n| n**2 }.inject(&:+)
  square_of_sum = (1..100).to_a.inject(&:+) ** 2
  puts "sum_of_squares = #{sum_of_squares}"
  puts "square_of_sum = #{square_of_sum}"
  puts square_of_sum - sum_of_squares
end

main
