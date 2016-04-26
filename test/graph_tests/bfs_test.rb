require 'test_helper'
require 'simple_graph'
require 'bfs'

class BFSTest < Minitest::Test

  def setup
    @g = SimpleGraph.new :allowed_classes => String
    @g.add_edge "Hello", "World"
    @g.add_edge "Hello", "Beautiful"
    @g.add_edge "Beautiful", "Girl"
    @bfs = GraphAlgorithms::BFS.new @g, "Hello"
  end

  def test_shortest_path
    actual = @bfs.shortest_path_to "Girl"
    expected = ["Beautiful", "Girl"]
    assert_equal expected, actual
  end


  def test_distance
    actual = @bfs.distance_to "Girl"
    expected = 2
    assert_equal expected, actual
  end


end