require 'graph'
class Digraph < Graph

  def initialize options={}
    options[:directed] = true
    super options
  end

end