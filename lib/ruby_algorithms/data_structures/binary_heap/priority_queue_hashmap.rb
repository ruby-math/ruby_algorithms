require 'binary_heap'
class PriorityQueueHashMap
  include BinaryHeap

  def initialize max_heap=false
    @elements = []
    @index = {}
    @is_min_heap = !max_heap
  end

  def pop
    min_or_max = @elements.shift.key
    @index[min_or_max] = nil
    min_or_max
  end

  def add (key, value)
    @elements << KeyValue.new(key, value)
    index = @elements.size - 1
    @index[key] = index
    bubble_up @elements, index
  end

  def updateKey(key, newValue)
    index = @index[key]
    return if index.nil?
    return if index >= @elements.size
    return if index < 0

    old = @elements[index].value
    @elements[index].update_value(newValue)

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
        @index[last_index] = nil
      else
        last_item = @elements.pop
        smallest_item = @elements.pop
        @elements << last_item
        @index[smallest] = nil
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
        @index[last_index] = nil
      else
        last_item = @elements.pop
        largest_item = @elements.pop
        @elements << last_item
        @index[largest] = nil
        largest_item
      end
    end
  end

  def empty?
    @elements.empty?
  end

  private
  attr_reader :elements, :is_min_heap

  def swap elements, i, j
    elements[i], elements[j] = elements[j], elements[i]
    @index[i], @index[j] = j, i
  end

  class KeyValue
    include Comparable

    attr_reader :key, :value

    def initialize key, value
      validate_value value
      @key = key
      @value = value
    end

    def update_value new_value
      validate_value new_value
      @value = new_value
    end


    def <=>(other)
      validate_other other
      @value <=> other.value
    end

    private
    def validate_other other
      unless other.is_a? KeyValue
        raise "Please provide KeyValue class"
      end
    end

    def validate_value value
      unless value.is_a?(Integer) || value.is_a?(Float)
        raise "Value must be a number"
      end
    end

  end

end