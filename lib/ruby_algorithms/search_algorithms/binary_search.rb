# Elements should be sorted in descending order
require 'byebug'
class BinarySearch

  def self.find(array, element, is_in_desc=false)
    @array = array
    @is_in_desc = !!is_in_desc
    binary_search element, 0, array.size - 1
  end

  private
  attr_reader :array, :is_in_desc

  def self.is_in_ascending_order?
    !@is_in_desc
  end

  def self.binary_search element, low, high

    return -1 if low > high
    middle = ((low + high) / 2).floor

    comparison = is_in_ascending_order? ? :> : :<
    if element == @array[middle]
      return middle
    elsif element.send comparison, @array[middle]
      binary_search element, middle + 1, high
    else
      binary_search element, low, middle - 1
    end
  end


end