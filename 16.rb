#!/usr/bin/env ruby

def main
  puts (2**1000).to_s.split(//).map(&:to_i).inject(&:+)
end

main
