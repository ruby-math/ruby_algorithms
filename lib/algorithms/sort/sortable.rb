require 'insertion_sort'
require 'merge_sort'
class Sortable
  attr_reader :array, :desc
  def initialize array, desc=false
    unless array.is_a? Enumerable
      raise "Please provide an array or other Enumerable"
    end
    unless (array.all? {|item| item.is_a? Comparable})
      raise "All objects must implement Comparable"
    end
    @array = array
    @desc = desc
  end

  def insertion_sort!
    @array = InsertionSort.order(@array, desc=@desc)
  end

  def equal? sortable
    unless sortable.is_a? Sortable
      return false
    end
    self.array == sortable.array
  end

  protected
  def is_desc?
    @desc
  end

end