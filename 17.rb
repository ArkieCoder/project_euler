#!/usr/bin/env ruby

require 'humanize'

limit = ARGV[0].to_i

def main(limit)
  puts (1..limit)
    .map{|n| n.humanize.gsub(/[- ]/,"").size}
    .inject(&:+)
end

main(limit)
