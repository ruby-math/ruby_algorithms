require 'sorting_strategy'

class MergeSort

  # Important Characteristics
  # 1. It is quite fast and has a time complexity of O(n log n)
  # 2. Time complexity of Merge Sort is O (n log n) in all 3 cases (worst, average and best)
  # as merge sort always divides the array in two halves and takes linear time to merge two halves
  # 3. It requires equal amount of additional space as the unsorted lsit. Hence its not at all recommended for search large unsorted lists
  # 4. It is the best Sorting technique for sorting Linked lists
  # 5. It follows the rule of Divide and Conquer
  # 6. It is Stable, as it does not change the relative order of elements with equal keys
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = MergeSort.order(array)
  #     puts array # Output:  [1, 2, 3, 4, 5, 6]
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = MergeSort.order(array, :desc => true)
  #     puts array # Output: [6, 5, 4, 3, 2, 1]
  #
  # OR
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     insertion = MergeSort.new(array)
  #     puts insertion.array # Output: [1, 2, 3, 4, 5, 6]
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     insertion = MergeSort.new(array, :desc => true)
  #     puts insertion.array # Output: [6, 5, 4, 3, 2, 1]
  #
  #
  # ### Get Time Complexity:
  # Example:
  #     best = MergeSort::TIME_COMPLEXITY_BEST
  #     worst = MergeSort::TIME_COMPLEXITY_WORST
  #     average = MergeSort::TIME_COMPLEXITY_AVERAGE
  #     space = MergeSort::SPACE_COMPLEXITY

  TIME_COMPLEXITY_WORST = "O(n log(n))"
  TIME_COMPLEXITY_AVERAGE = "O(n log(n))"
  TIME_COMPLEXITY_BEST = "O(n log(n))"
  SPACE_COMPLEXITY = "O(n)"

  attr_reader :array, :desc

  include SortingStrategy

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
    instance = MergeSort.new array, desc=desc
    instance.array
  end

  protected
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

  def is_desc?
    @desc
  end

end