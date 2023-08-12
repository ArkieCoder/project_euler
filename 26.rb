#!/usr/bin/env ruby
pp (1..1000).map { |denominator| 
  ## searching from 1..denominator,
  ## return the first result for which 10^t % denominator == 1
  ## or else 0
  (1..denominator).detect(lambda{0}) { |length|
    # the first length where this is true represents the length
    # of the longest cycle
    # this basically mimics what we do with long division -
    # multiply by 10 successively (pull down another 0) and find the
    # remainder -- if the remainder is 1 then that is the beginning/
    # end of the cycle
    (10**length % denominator) == 1
  } 
}.each_with_index.max[1] + 1
