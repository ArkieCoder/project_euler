#!/usr/bin/env ruby

L = 0
D = 1
R = 2
U = 3

def get_next_dir(current_dir)
  next_dir = current_dir + 1
  if current_dir == U
    next_dir = L
  end
  next_dir
end

def get_next_loc(last_loc, current_dir)
  case current_dir
  when L
    [last_loc.first - 1, last_loc.last]
  when D
    [last_loc.first, last_loc.last + 1]
  when R
    [last_loc.first + 1, last_loc.last]
  when U
    [last_loc.first, last_loc.last - 1]
  end
end

def sum_diags(grid)
  (0..grid.size-1).map{|n|
    grid[n][n] + grid[grid.size-1-n][n]
  }.inject(&:+) - 1
end

def main
  x_size = 1001
  y_size = 1001
  # x_size and y_size must both be odd
  grid = Array.new(y_size){Array.new(x_size)}
  max_n = x_size * y_size

  center = [
    (x_size - 1) / 2,
    (y_size - 1) / 2
  ]

  current_dir = U  
  last_loc = center
  current_loc = center

  (1..max_n).to_a.each{ |n|
    ## change direction on each move, unless
    ## cell is occupied, then stay the course
    next_dir = get_next_dir(current_dir)
    next_loc = get_next_loc(last_loc, next_dir)
    if grid[next_loc.first][next_loc.last]
      next_dir = current_dir
      next_loc = get_next_loc(last_loc, next_dir)
    end

    if n == 1
      grid[center.first][center.last] = n
      last_loc = center
    else
      grid[next_loc.first][next_loc.last] = n
      last_loc = next_loc
    end
    current_dir = next_dir
  }

  puts sum_diags(grid)
end

main
