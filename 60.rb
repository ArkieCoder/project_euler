#!/usr/bin/env ruby

# find the group of five primes that has the properties:
#  * Any two numbers concatenated are also prime
#  * The sum of the five is the lowest of any group
#    of five numbers meeting the first criteria

require 'prime'
require_relative '60_seed_data'
max_prime_index = ARGV[0].to_i
set_size = ARGV[1].to_i

def can_create_prime_from_two?(primes)
  PRIME_SEEDS_HASH.has_key?(primes.sort.join("-"))
end

def find_seed_prime_sets
  PRIME_SEEDS
end

def find_subsequent_prime_sets(max_level, max_prime_index)
  find_prime_sets_with_two_prime_property(
    max_level - 1,
    max_prime_index
  ).map { |prefix|
    Prime.take(max_prime_index).reject { |n|
      prefix.include?(n)
    }.select { |test_prime|
      valid=true
      prefix.each{ |element|
        valid = false if !can_create_prime_from_two?([element, test_prime])
      }
      valid
    }.map { |valid_add|
      (prefix + [valid_add]).sort
    }
  }.flatten(1).uniq
end

def find_prime_sets_with_two_prime_property(max_level, max_prime_index)
  return nil if max_level < 1
  max_level == 1 ? 
    find_seed_prime_sets :
    find_subsequent_prime_sets(max_level, max_prime_index)
end

def main(max_prime_index, set_size)
  prime_sets = find_prime_sets_with_two_prime_property(
    set_size,
    max_prime_index
  )

  prime_sets.map { |prime_set|
    {sum: prime_set.inject(&:+), elements: prime_set}
  }.sort{ |a, b|
    a[:sum] <=> b[:sum]
  }.map { |prime_set|
    puts "set: #{prime_set[:elements]}, sum: #{prime_set[:sum]}"
  }
end

main(max_prime_index, set_size)
