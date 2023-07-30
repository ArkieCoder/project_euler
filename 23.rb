#!/usr/bin/env ruby

require 'prime'
require 'set'
UPPER_LIMIT = 28123
MIN_ABUNDANT = 12

## stolen from Rosetta Code
## https://rosettacode.org/wiki/Proper_divisors
class Integer
  def proper_divisors
    return [] if self == 1
    ## create an array of prime factors representing
    ## the number of each prime within the number,
    ## so 20 -> [2, 2, 5], 200 -> [2, 2, 2, 5, 5]
    primes = prime_division.flat_map{|prime, how_many|
      [prime] * how_many
    }

    ## find all combinations from size 1 to the size of
    ## the list of primes, multiplying the results 
    ## together and collecting the results
    (1...primes.size).each_with_object([1]) do |n, acc|
      primes.combination(n).map{|pair|
        acc << pair.inject(:*)
      }
    end.flatten.uniq
  end

  def proper_divisors_sum
    proper_divisors.inject(&:+)
  end

  def is_perfect?
    proper_divisors_sum == self
  end

  def is_abundant?
    proper_divisors_sum > self
  end
end


def main
  abundant_numbers = (MIN_ABUNDANT..UPPER_LIMIT).select(&:is_abundant?)
  abundant_sums = abundant_numbers
    .repeated_combination(2)
    .map{|pair|
      pair.inject(&:+)
    }

  non_abundant_composite_sums = (1..UPPER_LIMIT).to_set - abundant_sums.to_set

  puts non_abundant_composite_sums.to_a.inject(&:+)
end

main
