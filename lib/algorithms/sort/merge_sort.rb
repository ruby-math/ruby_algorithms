require 'byebug'
class MergeSort
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
    self.sort
  end

  def self.order array, desc=false
    instance = InsertionSort.new array, desc=desc
    instance.array
  end

  def sort
    merge_sort @array, 0, array.length - 1
  end

  def merge_sort array, p, r
    byebug
    if p < r
      q = (p + r).floor
      merge_sort(array, p, q)
      merge_sort(array, q + 1, p)
    end
  end

end