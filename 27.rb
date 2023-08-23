#!/usr/bin/env ruby

require 'prime'
require 'pp'

def prime_quad(a,b,n)
  n*n+a*n+b
end

def main
  longest = (-1000..1000).to_a.combination(2).map {|a,b|
    next if a.abs == 1000

    i = 0
    result = 2

    until !result.prime? do
      result = prime_quad(a,b,i)
      i += 1
    end
    [a, b, i]
  }
    .select{|triplet| !triplet.nil?}
    .max_by{|triplet| triplet[2]}

  puts "Longest = #{longest}"
  puts "Product = #{longest[0] * longest[1]}"
end

main
