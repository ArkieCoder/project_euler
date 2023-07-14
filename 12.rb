#!/usr/bin/env ruby

require 'prime'
require 'pp'

n=ARGV[0].to_i

def factors(n)
  prime_bag = Prime.prime_division(n).map {|pd_pair| 
    ("#{pd_pair.first.to_s}," * pd_pair.last)
    .split(/,/)
  }
  .flatten(1)
  .map(&:to_i)


  factors = [1]
  factors << (1..prime_bag.size)
    .map{ |s|
      prime_bag.combination(s).to_a
    }
    .flatten(1)
    .uniq
    .map{|factor_list|
      factor_list.inject(&:*)
    }
    .sort
  factors.flatten!
end

def triangle_seq(n)
  (1..n).to_a.inject(&:+)
end

def main(n)
  triangle_seq_index = 0
  triangle_seq_number = 0
  triangle_seq_factors = []

  1.upto(Float::INFINITY) { |i|
    triangle_seq_index = i
    triangle_seq_number = triangle_seq(i)
    triangle_seq_factors = factors(triangle_seq_number)
    break if triangle_seq_factors.size > n
  }
  puts "triangle_seq_index: #{triangle_seq_index}"
  puts "triangle_seq_number: #{triangle_seq_number}"
  puts "triangle_seq_factors:"
  pp triangle_seq_factors
end
main(n)
