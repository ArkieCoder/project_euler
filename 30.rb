#!/usr/bin/env ruby

def main
  puts (10..1_000_000).to_a.filter{|n|
    digits = n.to_s.chars.map(&:to_i)
    n == digits.map{|m|
      m**5
    }.inject(&:+)
  }.inject(&:+)
end

main
