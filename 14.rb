#!/usr/bin/env ruby

require 'pp'

limit = ARGV[0].to_i
def even_step(n)
  n/2
end

def odd_step(n)
  3*n + 1
end

def collatz_seq(n)
  seq = [n]
  seq << (
    seq.last.odd? ?
    odd_step(seq.last) :
    even_step(seq.last)
  ) while seq.last != 1 
  seq
end

def main(limit)
  pp (1..limit-1).map { |n|
    chain = collatz_seq(n)
    {
      chain: chain,
      chain_size: chain.size,
      start_no: n
    }
  }
  .sort {|a,b| a[:chain_size] <=> b[:chain_size] }
  .last
end
main(limit)
