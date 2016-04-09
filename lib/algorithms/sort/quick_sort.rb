require 'sorting_interface'
class QuickSort
  # Important Characteristics
  # 1. Worst case is O(n ^ 2) but typically runs O (n log n)
  # 2. Not stable sort so it might change the occurence of two similar elements
  # in the list while sorting
  # 3. Can be very fast and requires very less additional space
  # 4. The algorithm divides the list into three main parts:
  #   - Elements less than the Pivot element
  #   - Pivot element
  #   - Elements greater than the pivot element
  # 5. Techniques Used:
  #    - Divide and conquer
  #    - Recursion
  #    - Array
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = QuickSort.order(array)
  #     puts array # Output:  [1, 2, 3, 4, 5, 6]
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = QuickSort.order(array, :desc => true)
  #     puts array # Output: [6, 5, 4, 3, 2, 1]
  #
  # OR
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     instance = QuickSort.new(array)
  #     puts instance.array # Output: [1, 2, 3, 4, 5, 6]
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     instance = QuickSort.new(array, :desc => true)
  #     puts instance.array # Output: [6, 5, 4, 3, 2, 1]
  #
  #
  # ### Get Time Complexity:
  # Example:
  #     best = QuickSort::TIME_COMPLEXITY_BEST
  #     worst = QuickSort::TIME_COMPLEXITY_WORST
  #     average = QuickSort::TIME_COMPLEXITY_AVERAGE

  include SortingInterface

  TIME_COMPLEXITY_WORST = "O(n^2)"
  TIME_COMPLEXITY_AVERAGE = "O(n log n)"
  TIME_COMPLEXITY_BEST = "O(n log n)"
  SPACE_COMPLEXITY = "O(n log n)"

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
    instance = QuickSort.new array, desc=desc
    instance.array
  end

  protected
  def sort
    n = array.length
    quick_sort array, 0, n - 1
  end

  def is_desc?
    @desc
  end

  def comparison_symbol
    is_desc? ? :>= : :<=
  end

  def quick_sort array, left, right

    if left < right
      pi = partition array, left, right
      quick_sort array, left, pi - 1
      quick_sort array, pi + 1, right
    end

  end

  def partition array, left, right
    pivot = left # could be randomly chosen
    swap array, pivot, right
    store = left
    for i in left..right-1
      if array[i].send(comparison_symbol, array[right])
        swap array, store, i
        store = store + 1
      end
    end
    swap array, store, right
    return store
  end
end