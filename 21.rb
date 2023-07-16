#!/usr/bin/env ruby

require 'prime'

def proper_divisors(n)
  prime_factors = n.prime_division.map{|s| s.first}
  proper_factors = [1]
  (1..10000).each{|x|
    ## admittedly this is kind of clumsy - we will be generating duplicates
    ## and other things which simply are not factors at all due to not looking
    ## at the _number_ of each factor in the prime factorization - but these
    ## are easy enough to filter out
    lp_proper_factors = prime_factors.repeated_combination(x).map{|factors|
      factors.inject(&:*)
    }
    ## if all results are greater than the input for this set size, 
    ## all further attempts will be fruitless
    break if lp_proper_factors.all?{|i| i > n}

    proper_factors += lp_proper_factors.filter{|i| i < n && n % i == 0}
    
  }
  proper_factors.uniq.sort
end

def proper_divisors_sum(n)
  proper_divisors(n).inject(&:+)
end

def are_amicable?(a,b)
  proper_divisors_sum(a) == b && proper_divisors_sum(b) == a 
end

def main
  amicables = (1..10000).to_a.combination(2).filter{|pair|
    puts "Testing #{pair}"
    are_amicable?(*pair)
  }
  puts amicables.inject(&:+)
end

main
