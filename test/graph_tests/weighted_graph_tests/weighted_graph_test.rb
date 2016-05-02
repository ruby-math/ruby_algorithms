require 'test_helper'
require 'weighted_graph'

class WeightedGraphTest < Minitest::Test

  def setup
    @undirected_graph = WeightedGraph.new :allowed_classes => String
    @directed_graph = WeightedGraph.new :allowed_classes => String, :directed => true
  end


  def test_that_setting_weight_goes_both_ways_in_undirected_graph
    @undirected_graph.add_edge "Hello", "Brother", 10
    assert_equal 10, @undirected_graph.weight("Hello", "Brother")
    assert_equal 10, @undirected_graph.weight("Brother", "Hello")
  end

  def test_that_setting_weight_goes_one_way_in_directed_graph
    @directed_graph.add_edge "Hello", "Brother", 10
    assert_equal 10, @directed_graph.weight("Hello", "Brother")
    assert_nil @directed_graph.weight("Brother", "Hello")
  end

  def test_that_weight_is_nil_if_no_edge
    @undirected_graph.add_vertex "Hello"
    @undirected_graph.add_vertex "Brother"
    assert_nil @undirected_graph.weight("Hello", "Brother")
  end



end