require 'helpers/interface'
module SortingStrategy
  extend Interface
  method :order

  def initialize container, desc=false
    unless container.is_a? Enumerable
      raise "Please provide an array or other Enumerable"
    end
    unless (container.all? {|item| item.is_a? Comparable})
      raise "All objects must implement Comparable"
    end
  end

  def swap array, i, j
    array[i], array[j] = array[j], array[i]
  end
end