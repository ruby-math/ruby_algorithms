require 'test_helper'
require 'graph'

class SimpleGraphTest < Minitest::Test

  def setup
    @g = SimpleGraph.new
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
      non_directed_graph = Graph.new :directed => false
      non_directed_graph.add_edge @f1, @f2
      assert(non_directed_graph.connected_vertices(@f1), Graph::EdgeList.new([@f2]))
      assert(non_directed_graph.connected_vertices(@f2), Graph::EdgeList.new([@f1]))
  end

  def test_that_nondirected_graph_is_the_default
    non_directed_graph = Graph.new
    non_directed_graph.add_edge @f1, @f2
    assert(non_directed_graph.connected_vertices(@f1), Graph::EdgeList.new([@f2]))
    assert(non_directed_graph.connected_vertices(@f2), Graph::EdgeList.new([@f1]))
  end

  def test_that_directed_graph_is_one_way
    digraph = Graph.new :directed=> true
    digraph.add_edge @f1, @f2
    assert(digraph.connected_vertices(@f1), Graph::EdgeList.new([@f2]))
    assert(digraph.connected_vertices(@f2), Graph::EdgeList.new)
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
    @g.add_edge @non_existing_edge, @f1
    assert @g.vertex_list.include?(@non_existing_edge)
  end

  def test_that_you_get_true_when_you_add_vertex
    assert @g.add_vertex @f1
  end

  def test_that_you_get_nil_or_false_when_you_add_vertex_that_already_exists
    @g.add_vertex @f1
    assert !(@g.add_vertex @f1)
  end

  def test_that_vertex_is_not_overwritten_if_exists_aka_connected_vertices_stays_the_same
    @g.add_edge @f1, @f2
    connected_vertices = @g.connected_vertices @f1
    @g.add_vertex @f1
    assert_equal @g.connected_vertices(@f1), connected_vertices
  end


  def test_that_outsider_cannot_change_vertex_list_by_accessing_vertex_list_accessor
    @g.add_vertex_list @f1, @f2
    @g.vertex_list.delete @f1
    assert @g.vertex_list.include? @f1
  end

  def test_that_outsider_cannot_change_edge_list_by_accessing_edge_list_accessor
    @g.add_vertex_list @f1, @f2
    @g.add_edge @f1, @f2
    @g.connected_vertices(@f1).delete @f1
    assert @g.vertex_list.include? @f1
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