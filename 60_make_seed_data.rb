#!/usr/bin/env ruby

require 'prime'
require 'pp'

max_prime_index = ARGV[0].to_i

def can_create_prime_from_two?(primes)
  primes.join.to_i.prime? && primes.reverse.join.to_i.prime?
end

def find_seed_prime_sets(max_prime_index)
  ## I tried to improve on the run time of this by generating
  ## the combinations manually.  No such luck.  It was slower
  ## than using :combination.  
  Prime.take(max_prime_index).combination(2).select { |c|
    can_create_prime_from_two?(c)
  }
end

def main(max_prime_index)
  sps = find_seed_prime_sets(max_prime_index)
  print "PRIME_SEEDS ="
  pp sps
  print "PRIME_SEEDS_HASH ="
  pp sps.map {|x| {x.join("-") => true}}.inject(&:merge)
end

main(max_prime_index)
