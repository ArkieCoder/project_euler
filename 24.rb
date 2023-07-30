#!/usr/bin/env ruby

def main
  puts "0123456789".chars.permutation.lazy.drop(999_999).first.join
end

main
