#!/usr/bin/env ruby
require 'pp'

def is_int?(n)
  n.to_i == n
end

def is_square?(n)
  is_int?(n**0.5)
end

def main
  max_num = 1000
  pp 1.upto(max_num).map{ |a|
    1.upto(max_num).map { |b|
      c_squared = a**2 + b**2
      c = (c_squared**0.5).to_i 
      [a, b, c, a+b+c] if is_square?(c_squared) && a < b
    }
  }
  .flatten(1)
  .reject(&:nil?)
  .select { |a| a[3] == 1000 }
  .map { |a|
    a.push a[0,3].inject(&:*)
  }
  .map { |a|
    {
      a: a[0],
      b: a[1],
      c: a[2],
      sum: a[3],
      abc: a[4]
    }
  }
end

main
