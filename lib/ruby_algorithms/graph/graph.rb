class Graph
  attr_reader :directed, :n
  def initialize n, directed=false
    @directed = directed
    @n = n
  end
end