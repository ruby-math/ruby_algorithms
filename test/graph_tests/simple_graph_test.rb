require 'test_helper'
require 'graph'

class SimpleGraphTest < Minitest::Test

  def setup
    @g = SimpleGraph.new
    @f1 = Friend.new "Jane"
    @f2 = Friend.new "Hillary"
  end

  def teardown
    # Do nothing
  end

  def test_that_you_can_add_non_existing_edge_using_add_edge
    @non_existing_edge = Friend.new "Mark"
    @g.add_edge @non_existing_edge, @f1
    assert @g.vertex_list.include?(@non_existing_edge)
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