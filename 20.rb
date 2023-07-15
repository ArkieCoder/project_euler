#!/usr/bin/env ruby

require 'facets'

def main
  puts 100.factorial.to_s.split(//).map{|n| n.to_i}.inject(&:+)
end

main
