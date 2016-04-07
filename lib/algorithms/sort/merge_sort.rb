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
    if p < r
      q = ((p + r) / 2).floor
      merge_sort(array, p, q)
      merge_sort(array, q + 1, r)
      merge(array, p, q, r)
    end
  end

  def merge array, p, q, r
    n1 = q - p + 1
    n2 = r - q
    left_array = []
    right_array = []

    for i in 1..n1
      left_array[i] = array[p + i - 1]
    end

    for j in 1..n2
      right_array[j] = array[q + j]
    end

    i = 1
    j = 1
    for k in p..r

      if i >= left_array.length && (j < right_array.length)
        array[k] = right_array[j]
        j = j + 1
        next
      elsif j >= right_array.length && (i < left_array.length)
        array[k] = left_array[i]
        i = i + 1
        next
      elsif j >= right_array.length && i >= left_array.length
        break
      end

      comparison = is_desc? ? (left_array[i] >= right_array[j]) : (left_array[i] <= right_array[j])
      if comparison
        array[k] = left_array[i]
        i = i + 1
      else
        array[k] = right_array[j]
        j = j + 1
      end
    end
  end

  protected
  def is_desc?
    @desc
  end

end