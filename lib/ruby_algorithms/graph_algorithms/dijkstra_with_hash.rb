require 'priority_queue_hashmap'
require 'weighted_graph'
module GraphAlgorithms

  class DijkstraWithHash
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
      @dist = Hash.new
      @parent = Hash.new
      vertices = graph.vertices
      priority_queue = PriorityQueueHashMap.new
      vertices.each do |v|
        dist[v] = Float::INFINITY
        priority_queue.add(v, dist[v])
        parent[v] = nil
      end

      dist[start] = 0;
      priority_queue.updateKey(start, dist[start])

      while (!priority_queue.empty?)
        v = priority_queue.getMin
        adj = graph.adj(v)
        adj.each do |u|
          weight = graph.weight(v, u) || Float::INFINITY
          if (dist[u] > dist[v]+weight)
            dist[u] = dist[v]+weight
            priority_queue.updateKey(u, dist[u])
            parent[u] = v
          end
        end
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