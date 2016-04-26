require 'graph'
module GraphAlgorithms
  class BFS

    def initialize(graph, start)
      validate_graph graph
      validate_vertex_exists graph, start
      bfs(graph, start)
    end


    def shortest_path_to v
      recursive_path_to v
    end

    def distance_to v
      @dist[v]
    end

    private
    def recursive_path_to v, path=[]
      unless v.nil?
        parent = @parent[v]
        recursive_path_to parent, path
        unless parent.nil?
          path << v
        end
      end
    end

    attr_reader :parent, :dist, :graph
    def bfs (graph, start)
      vertices = graph.vertices
      state = Hash.new
      @parent = Hash.new
      @dist = Hash.new
      vertices.each do |vertex|
        state[vertex] = "undiscovered"
        parent[vertex] = nil
        dist[vertex] = Float::INFINITY
      end

      state[start] = "discovered"
      parent[start] = nil
      dist[start] = 0
      queue = [start]
      while !queue.empty?
        u = queue.shift
        adj = graph.adj u
        adj.each do |v|
          if state[v] == "undiscovered"
            state[v] = "discovered"
            parent[v] = u
            dist[v] = dist[u] + 1
            queue.unshift(v)
          end
        end
        state[u] = "processed"
      end

    end

    def validate_graph g
      unless g.is_a? Graph
        raise "Please provide a Graph"
      end
    end

    def validate_vertex_exists graph, vertex
      unless graph.has_vertex? vertex
        raise "Provided vertex not in graph"
      end
    end

  end

end