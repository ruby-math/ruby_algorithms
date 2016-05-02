require 'byebug'
class Graph
  include Enumerable
  attr_reader :no_of_edges

  def initialize options={}
    @no_of_edges = 0
    @set_of_vertices = VertexList.new
    @adjacent_vertices = Hash.new
    @directed = !!options[:directed]
    @weighted = !!options[:weighted]
    @disallow_self_loops = !options[:allow_self_loops]
    @type_of_edge = weighted ? WeightedEdgeList : EdgeList
    allowed_classes = options[:allowed_classes] || Object
    allowed_classes.is_a?(Array) ? parse_allowed_classes(*allowed_classes) : parse_allowed_classes(allowed_classes)
  end

  def add_vertex v
    validate_vertex v
    was_added = @set_of_vertices.add?(v)
    if was_added
      @adjacent_vertices[v] = type_of_edge.new
    end
    return was_added
  end

  def add_vertices *vertices
    vertices.each do |v|
      unless add_vertex(v)
        "Failed to add #{v}"
      end
    end
  end

  def is_directed?
    @directed
  end

  def vertices
    @set_of_vertices.clone
  end

  def adj v
    validate_vertex_exists v
    @adjacent_vertices[v].clone
  end

  def add_edge v, w
    validate_if_self_loop v, w
    add_vertex v
    add_vertex w
    if @directed
      add_edge_directed v, w
    else
      add_edge_undirected v, w
    end
  end

  def has_vertex? v
    @set_of_vertices.include? v
  end

  def is_dual_connected? v, w
    @adjacent_vertices[v].include?(w) && @adjacent_vertices[w].include?(v)
  end

  def is_connected? v, w
    @adjacent_vertices[v].include?(w)
  end

  def degree v
    unless @set_of_vertices.include? v
      raise "Vertex not found"
    end
    @adjacent_vertices[v].size
  end

  def to_s
    s = "#{no_of_vertices} vertices, #{no_of_edges} edges\n"
    @set_of_vertices.each do |v|
      s += "Vertex: #{v}\n"
      s += "Adjacency: #{@adjacent_vertices}\n"
    end
    s
  end

  def no_of_vertices
    @set_of_vertices.size
  end

  private
  attr_reader :set_of_vertices, :adjacent_vertices, :allowed_classes, :directed, :weighted, :type_of_edge
  attr_reader :disallow_self_loops
  def parse_allowed_classes *args
    @allowed_classes = Set.new
    args.each do |constant|
      validate_class_or_module constant
      @allowed_classes.add constant
    end
  end

  def add_edge_directed v, w
    unless is_connected? v, w
      @adjacent_vertices[v].add  w
      @no_of_edges += 1
      return true
    end
  end

  def add_edge_undirected v, w
    unless is_dual_connected? v, w
      @adjacent_vertices[v].add  w
      @adjacent_vertices[w].add v
      @no_of_edges += 1
      return true
    end
  end

  def validate_vertex_exists v
    unless @set_of_vertices.include? v
      raise "Vertex not found"
    end
  end

  def validate_vertex v
    ancestors = Set.new(v.class.ancestors)
    unless allowed_classes.intersect? ancestors
      raise "#{v} is not an instance of an allowed class #{allowed_classes.inspect}"
    end
  end

  def validate_if_self_loop v, w
    if v.eql?(w) && disallow_self_loops
      raise "Self Loops not allowed"
    end
  end

  def validate_class_or_module constant
    unless constant.is_a?(Module) || constant.is_a?(Class)
      raise "Please provide a module or class"
    end
  end

  class EdgeList < Set
  end

  class WeightedEdgeList < EdgeList
    def initialize(enum = nil, &block)
      super
      @weights_to = Hash.new
    end

    def add? o, options={}
      if include?(o)
        nil
      else
        add(o, options)
      end
    end

    def add o, options={}
      super o
      unless weights_to[o]
        weight = options[:weight] || 0
        weights_to[o] = weight
      # weights_to[o].freeze
      end
    end

    def weight node
      validate_item node
      @weights_to[node]
    end


    private
    attr_reader :weights_to, :edges
    def validate_item node
      unless @weights_to.include? node
        raise "EdgeNode not found"
      end
    end


  end



  class VertexList < Set
  end

end