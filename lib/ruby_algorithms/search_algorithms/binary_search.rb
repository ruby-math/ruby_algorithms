# Elements should be sorted in descending order
class BinarySearch

  def self.find(array, element)
    @array = array
    binary_search element, 0, array.size
  end


  private
  attr_reader :array
  def self.binary_search element, low, high

    return -1 if low > high
    middle = ((low + high) / 2).floor

    if element == @array[middle]
      return middle
    elsif element > @array[middle]
      binary_search element, middle + 1, high
    else
      binary_search element, low, middle - 1
    end
  end


end