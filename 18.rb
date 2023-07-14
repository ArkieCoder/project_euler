#!/usr/bin/env ruby

require 'rgl/adjacency'
require 'rgl/traversal'
require 'pp'

big_triangle_s="""
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
"""

def get_vertex_value(vertex)
  vertex.split(/:/).last.to_i
end

class DAGWithRTLSum < RGL::DirectedAdjacencyGraph
  def max_root_to_leaf_sum(vertex)
    vertex_value = get_vertex_value(vertex)
    adjacent_vertices = self.adjacent_vertices(vertex)
    if(adjacent_vertices.any?)
      return adjacent_vertices(vertex).map{|v|
        self.max_root_to_leaf_sum(v) + vertex_value
      }.max 
    else
      return vertex_value
    end
  end
end

def main(big_triangle_s)
  triangle_data = big_triangle_s.lines.map(&:chomp).map(&:split)
  triangle_data.shift
  dag_data = []
  triangle_data.each_with_index{|row, row_num|
    row.each_with_index{|n, col_num|
      node="#{row_num},#{col_num}:#{n}"
      if(row_num < triangle_data.size - 1)
        l_val = triangle_data[row_num+1][col_num]
        r_val = triangle_data[row_num+1][col_num+1]
        l_node="#{row_num+1},#{col_num}:#{l_val}"
        r_node="#{row_num+1},#{col_num+1}:#{r_val}"
        dag_data += [node, l_node, node, r_node]
      end
    }
  }
  dg = DAGWithRTLSum[*dag_data]
  root_vertex = dg.vertices.filter{|v| v =~ /^0,0:/}.first
  puts dg.max_root_to_leaf_sum(root_vertex)
end

main(big_triangle_s)
