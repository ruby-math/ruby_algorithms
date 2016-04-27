require 'binary_heap'
class PriorityQueue
  include BinaryHeap

  def initialize min_heap=false
    @elements = []
    @is_min_heap = !!min_heap
  end

  def pop
    min_or_max = @elements.shift
    bubble_down @elements, 0
    min_or_max
  end


  def <<(element)
    @elements << element
    bubble_up @elements, @elements.size - 1
  end

  private
  attr_reader :elements, :is_min_heap


  def swap array, i, j
    array[i], array[j] = array[j], array[i]
  end

end