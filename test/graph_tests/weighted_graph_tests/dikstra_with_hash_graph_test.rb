$LOAD_PATH << "/Users/uchennafokoye/RubymineProjects/algorithms/test"
require 'test_helper'
require 'weighted_graph'
require 'byebug'
require 'dijkstra_with_hash'

class DijkstraWithHashGraphTest < Minitest::Test

  def setup
    @undirected_graph = WeightedGraph.new :allowed_classes => String
    # @directed_graph = WeightedGraph.new :allowed_classes => String, :directed => true
  end

  def test_shortest_path
    @undirected_graph.add_edge "Hello", "World", 20
    @undirected_graph.add_edge "World", "Girl", 10
    @undirected_graph.add_edge "Hello", "Beautiful", 10
    @undirected_graph.add_edge "Beautiful", "Girl", 5
    @dijkstra = GraphAlgorithms::DijkstraWithHash.new @undirected_graph, "Hello"
    actual = @dijkstra.shortest_path_to "Girl"
    expected = ["Beautiful", "Girl"]
    assert_equal expected, actual
  end

  def test_second_shortest_path
    @undirected_graph.add_edge "Hello", "World", 10
    @undirected_graph.add_edge "World", "Girl", 10
    @undirected_graph.add_edge "Hello", "Beautiful", 20
    @undirected_graph.add_edge "Beautiful", "Girl", 5
    @dijkstra = GraphAlgorithms::DijkstraWithHash.new @undirected_graph, "Hello"
    actual = @dijkstra.shortest_path_to "Girl"
    expected = ["World", "Girl"]
    assert_equal expected, actual
  end



end