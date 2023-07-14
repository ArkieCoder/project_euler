#!/usr/bin/env ruby

# find the sum of all even fibonacci terms < 4 million

require 'pp'

limit = ARGV[0].to_i

def fib_array(a)
  fib = [1,1]
  if a > 2
    (a-2).times {
      fib.push fib[-1] + fib[-2]
    }
  end
  fib
end

def main(limit)
  result = fib_array(limit)
    .select { |x| x.even? && x <= 4_000_000 }
    .inject(&:+)
  puts "The sum of the even fibonacci numbers less than 4 million is:"
  puts result
end

main(limit)

