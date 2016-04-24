require 'test_helper'
require 'simple_graph'
require 'digraph'

class SimpleGraphTest < Minitest::Test

  def setup
    @undirected_graph = SimpleGraph.new
    @graph_of_friends = SimpleGraph.new :allowed_classes=> Friend
    @f1 = Friend.new "Jane"
    @f2 = Friend.new "Hillary"
    @s1 = Student.new "Female"
    @s2 = Student.new "male"
  end

  def teardown
    # Do nothing
  end


  def test_that_nondirected_graph_is_two_way
      non_directed_graph = SimpleGraph.new :directed => false
      non_directed_graph.add_edge @f1, @f2
      assert(non_directed_graph.is_dual_connected? @f1, @f2)
  end

  def test_that_nondirected_graph_is_the_default
    non_directed_graph = SimpleGraph.new
    non_directed_graph.add_edge @f1, @f2
    assert(non_directed_graph.is_dual_connected? @f1, @f2)
  end

  def test_that_digraph_produces_a_directed_graph
    digraph = Digraph.new
    digraph.add_edge @f1, @f2
    assert(digraph.is_connected? @f1 ,@f2)
    assert(!digraph.is_connected?(@f2, @f1))
  end

  def test_that_digraph_is_always_directed_even_with_optional_parameters
    digraph = Digraph.new :directed => false
    digraph.add_edge @f1, @f2
    assert(digraph.is_connected? @f1 ,@f2)
    assert(!digraph.is_connected?(@f2, @f1))
  end

  def test_that_directed_graph_is_one_way
    digraph = SimpleGraph.new :directed=> true
    digraph.add_edge @f1, @f2
    assert(digraph.is_connected? @f1 ,@f2)
    assert(!digraph.is_connected?(@f2, @f1))
  end

  def test_that_you_can_restrict_graph_to_multiple_classes_with_array
    graph_of_multiple_classes = SimpleGraph.new :allowed_classes => [Friend, Student]
    assert graph_of_multiple_classes.add_vertex @f1
    assert graph_of_multiple_classes.add_vertex @s1
  end

  def test_that_restricted_graph_allows_objects_of_allowed_classes
    assert @graph_of_friends.add_vertex @f1
  end

  def test_that_restricted_graph_will_reject_objects_not_a_type_of_the_allowed_classes
    begin
      @graph_of_friends.add_vertex 1
      fail("Expected an error to be thrown")
    rescue
      assert true
    end
  end

  def test_that_you_can_add_non_existing_edge_using_add_edge
    @non_existing_edge = Friend.new "Mark"
    @undirected_graph.add_edge @non_existing_edge, @f1
    assert @undirected_graph.has_vertex? (@non_existing_edge)
  end

  def test_that_you_get_true_when_you_add_vertex
    assert @undirected_graph.add_vertex @f1
  end

  def test_that_you_get_nil_or_false_when_you_add_vertex_that_already_exists
    @undirected_graph.add_vertex @f1
    assert !(@undirected_graph.add_vertex @f1)
  end

end

class Friend
  attr_reader name
  def initialize name
    @name = name
  end
end

class Student
  attr_reader :gender
  def initialize gender
    @gender = gender
  end
end