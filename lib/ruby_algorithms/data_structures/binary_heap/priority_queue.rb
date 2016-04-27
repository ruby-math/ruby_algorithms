require 'binary_heap'
class PriorityQueue
  include BinaryHeap

  def initialize max_heap=false
    @elements = []
    @is_min_heap = !max_heap
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

  def updateKey(index, newValue)
    return if index >= @elements.size
    return if index < 0
    old = @elements[index]
    @elements[index] = newValue

    if (is_min_heap?)
      if (newValue < old)
        bubble_up @elements, index
      else
        bubble_down @elements, index
      end
    end

    if (is_max_heap?)
      if (newValue > old)
        bubble_up @elements, index
      else
        bubble_down @elements, index
      end
    end

  end


  def getMin
    if is_min_heap?
      pop
    else
      size = @elements.size
      last_index = size - 1
      smallest = last_index
      if @elements[size - 2] < @elements[last_index]
        smallest = size - 2
      end
      if last_index == smallest
        @elements.pop
      else
        last_item = @elements.pop
        smallest_item = @elements.pop
        @elements << last_item
        smallest_item
      end
    end
  end


  def getMax
    if is_max_heap?
      pop
    else
      size = @elements.size
      last_index = size - 1
      largest = last_index
      if @elements[size - 2] > @elements[last_index]
        largest = size - 2
      end
      if last_index == largest
        @elements.pop
      else
        last_item = @elements.pop
        largest_item = @elements.pop
        @elements << last_item
        largest_item
      end
    end
  end

  def empty?
    @elements.empty?
  end

  private
  attr_reader :elements, :is_min_heap

  def swap array, i, j
    array[i], array[j] = array[j], array[i]
  end

end