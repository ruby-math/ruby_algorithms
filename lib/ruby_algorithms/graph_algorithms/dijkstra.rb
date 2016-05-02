require 'priority_queue'
require 'weighted_graph'
module GraphAlgorithms

  class Dijkstra
    def initialize(graph, start)
      validate_graph graph
      validate_vertex_exists graph, start
      dijkstra(graph, start)
    end


    def shortest_path_to v
      recursive_path_to v
    end

    def distance_to v
      @dist[v]
    end

    private
    attr_reader :parent, :dist, :graph
    def dijkstra (graph, start)
      intree = Hash.new
      @dist = Hash.new
      @parent = Hash.new
      vertices = graph.vertices
      vertices.each do |v|
        intree[v] = false
        dist[v] = Float::INFINITY
        parent[v] = nil
      end

      dist[start] = 0;
      queue = [start]
      v = queue.pop

      while (intree[v] == false)
        intree[v] = true
        adj = graph.adj(v)
        adj.each do |u|
          weight = graph.weight(v, u) || Float::INFINITY
          if (dist[u] > dist[v]+weight)
            dist[u] = dist[v]+weight
            parent[u] = v
            queue.unshift(u)
          end
        end
        v = queue.pop
      end

    end

    def recursive_path_to v, path=[]
      unless v.nil?
        parent = @parent[v]
        recursive_path_to parent, path
        unless parent.nil?
          path << v
        end
      end
    end

    def validate_graph g
      unless g.is_a? WeightedGraph
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