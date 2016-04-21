#Implements a simple graph
#See SimpleGraph
class Graph
  attr_reader :no_of_edges, :directed

  def initialize directed=false
    @no_of_edges = 0
    @vertices = VertexList.new
    @adjacent_vertices = Hash.new
    @directed = directed
  end

  def add_vertex v
    added = @vertices.add?(v)
    if added
      @adjacent_vertices[v] = EdgeList.new
    end
    return added
  end

  def add_vertex_list *vertices
    vertices.each do |v|
      unless add_vertex(v)
        "Failed to add #{v}"
      end
    end
  end

  def add_edge v, w
    add_vertex v
    add_vertex w
    unless is_connected v, w
      @adjacent_vertices[v].add?  w
      unless @directed
        @adjacent_vertices[w].add v
      end
      @no_of_edges += 1
      return true
    end
  end

  def vertex_list
    VertexList.new @vertices
  end

  def connected_vertices v
    EdgeList.new @adjacent_vertices[v]
  end

  def degree v
    validate_vertex v
    @adjacent_vertices[v].size
  end

  def to_s
    s = "#{no_of_vertices} vertices, #{no_of_edges} edges\n"
    @vertices.each do |v|
      s += "Vertex: #{v}\n"
      s += "Adjacency: #{@adjacent_vertices}\n"
    end
    s
  end

  def no_of_vertices
    @vertices.size
  end

  private
  attr_reader :vertices, :adjacent_vertices
  def validate_vertex v
    unless @vertices.include? v
      raise "Vertex not found"
    end
  end
  def is_connected v, w
    @adjacent_vertices[v].include?(w) || @adjacent_vertices[w].include?(v)
  end

  class EdgeList < Set
  end
  class VertexList < Set
  end
end

class SimpleGraph < Graph
end