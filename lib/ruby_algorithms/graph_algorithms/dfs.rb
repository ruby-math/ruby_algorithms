module GraphAlgorithms

  class DFS
    def initialize graph, start
      validate_graph graph
      validate_vertex_exists graph, start
      dfs(graph, start)
    end

    def path_to v
      recursive_path_to v
    end

    private
    attr_reader :state, :discovered, :finished, :parent, :counter

    # Also repeated in bfs
    def recursive_path_to v, path=[]
      unless v.nil?
        parent = @parent[v]
        recursive_path_to parent, path
        unless parent.nil?
          path << v
        end
      end
    end

    def dfs (graph, start)
      vertices = graph.vertices
      @state = Hash.new
      @parent = Hash.new
      @discovered = Hash.new
      @finished = Hash.new
      @counter = 0
      vertices.each do |vertex|
        state[vertex] = "undiscovered"
        parent[vertex] = nil
      end
      recursive_dfs graph, start
    end

    def recursive_dfs graph, u
      state[u] = "discovered"
      discovered[u] = counter
      @counter += 1
      adj = graph.adj u
      adj.each do |v|
        if state[v] == "undiscovered"
          parent[v] = u
          recursive_dfs graph, v
        end
      end
      state[u] = "processed"
      finished[u] = counter
      @counter += 1
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