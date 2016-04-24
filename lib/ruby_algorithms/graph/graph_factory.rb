require 'graph'
class GraphFactory

  SIMPLE = "simple"
  WEIGHTED = "weighted"
  DIRECTED = "digraph"

  def buildGraph options = {}
    type = options[:type] || "simple"
    case type
      when SIMPLE
        new SimpleGraph.new options
      when WEIGHTED
        new WEIGHTED.new options
      when DIRECTED
        new Digraph.new options
      else
        new SimpleGraph.new options
    end
  end

end