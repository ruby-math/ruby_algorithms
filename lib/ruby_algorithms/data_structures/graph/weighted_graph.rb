require 'graph'
class WeightedGraph < Graph

  def initialize options={}
    options[:weighted] = true
    super options
  end

  def add_edge v, w, weight=0
    validate_if_self_loop v, w
    add_vertex v
    add_vertex w
    if @directed
      add_edge_directed v, w, weight
    else
      add_edge_undirected v, w, weight
    end

  end

  def weight v, w
    validate_vertex v
    validate_vertex w
    if is_connected? v, w
      @adjacent_vertices[v].weight w
    else
      nil
    end
  end

  private
  def add_edge_directed v, w, weight
    unless is_connected? v, w
      @adjacent_vertices[v].add  w, :weight => weight
      @no_of_edges += 1
      return true
    end
  end

  def add_edge_undirected v, w, weight
    unless is_dual_connected? v, w
      @adjacent_vertices[v].add  w, :weight => weight
      @adjacent_vertices[w].add v, :weight => weight
      @no_of_edges += 1
      return true
    end
  end


end