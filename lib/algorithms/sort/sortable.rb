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

  # You carry a pointer. This pointer indicates last sorted point
  # You iterate backwards comparing new pointer (i) to all other array points (j)
  # If it is less than/greater than, then place it in its rightful position
  # For descending order, just do the opposite.
  def insertion_sort!
    array = @array
    for i in 1...array.length
      current_no = array[i]
      j = i - 1
      while j >= 0
        comparison = is_desc? ? (current_no > array[j]) : (current_no < array[j])
        unless comparison
          break
        end
        array[j+1] = array[j]
        j = j - 1
      end
      array[j+1] = current_no
    end
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