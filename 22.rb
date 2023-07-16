#!/usr/bin/env ruby

def alpha_positions(letters)
  letters.downcase.bytes.map{|ascii|
    ascii - ("a".bytes.first - 1)
  }
end

def name_score(name, sorted_names)
  alpha_positions(name).inject(&:+) *
    (sorted_names.index(name) + 1)
end

def main
  sorted_names = File.open("0022_names.txt").read
    .gsub(/"/,"").split(/,/).sort

  puts sorted_names.map{|name|
    name_score(name, sorted_names)
  }.inject(&:+)
end

main
