#!/usr/bin/ruby

require 'fortune'

=begin
  This one confused me for a while.

  I at first had considered a combinatoric approach, but didn't understand
  the problem completely enough and approached it incorrectly.

  Considering the example given (2x2 grid), you have 6 paths possible.  If
  we use R to represent 'right' and D to represent 'down, those paths become:
    RRDD
    RDRD
    RDDR
    DDRR
    DRDR
    DRRD

  So then, the path length will always be 2n for an n x n grid.  And we must
  have the number of down moves equal to the number of right moves.

  So then, the problem becomes (for an n x n grid) how many ways can you
  choose n right moves from 2n total moves?  Stated combinatorically, 
  tht's 2n choose n.  In the case of the 20 x 20 grid, it's 40 choose 20.

  In other words, given 40 things (in this case 40 moves on a grid), how
  many ways can you choose 20 of those things?  This is equal to the
  formula 40! / (20! * (40-20)!) = 40! / (20! * 20!).

  But I like to use fancy gems, so I used the 'fortune' gem to do the
  combinatorics :)

=end

sz=ARGV[0].to_i

def main(sz)
  puts Fortune::C.calc(elements:sz*2, select: sz)
end

main(sz)
