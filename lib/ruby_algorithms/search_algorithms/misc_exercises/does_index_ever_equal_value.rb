module DoesIndexEverEqualValue

  def does_index_ever_equal_value array
    @array = array
    find 1, array.size - 1
  end


  private
  attr_reader :array
  def find low, high
    return false if low > high
    i = ((low + high)/2).floor
    return true if array[i] == i
    return find(i + 1, high) if (array[i] < i)
    return find(low, i - 1) if (array[i] > i)
  end
end