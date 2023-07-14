#!/usr/bin/env ruby

require 'prime' 
require 'pp'

limit = ARGV[0].to_i

def main(limit)
  puts Prime.each(limit).to_a.inject(&:+)
end
main(limit)
