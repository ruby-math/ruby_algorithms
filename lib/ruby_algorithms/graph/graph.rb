class Graph
  attr_reader :no_of_edges, :directed

  def initialize options={}
    @no_of_edges = 0
    @vertices = VertexList.new
    @adjacent_vertices = Hash.new
    @directed = options[:directed] || false
    allowed_classes = options[:allowed_classes] || Object
    allowed_classes.is_a?(Array) ? parse_allowed_classes(*allowed_classes) : parse_allowed_classes(allowed_classes)
  end

  def add_vertex v
    validate_vertex v
    was_added = @vertices.add?(v)
    if was_added
      @adjacent_vertices[v] = EdgeList.new
    end
    return was_added
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
    unless @vertices.include? v
      raise "Vertex not found"
    end
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
  attr_reader :vertices, :adjacent_vertices, :allowed_classes
  def parse_allowed_classes *args
    @allowed_classes = Set.new
    args.each do |constant|
      validate_class_or_module constant
      @allowed_classes.add constant
    end
  end

  def validate_vertex_exists v
    unless @vertices.include? v
      raise "Vertex not found"
    end
  end

  def validate_vertex v
    ancestors = Set.new(v.class.ancestors)
    unless allowed_classes.intersect? ancestors
      raise "#{v} is not an instance of an allowed class #{allowed_classes.inspect}"
    end
  end

  def validate_class_or_module constant
    unless constant.is_a?(Module) || constant.is_a?(Class)
      raise "Please provide a module or class"
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

#SimpleGraph implements a uni or bigraph with no weights
class SimpleGraph < Graph
end