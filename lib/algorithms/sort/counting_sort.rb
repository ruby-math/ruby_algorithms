require 'sorting_interface'
class CountingSort
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
  #     array = CountingSort.order(array)
  #     puts array # Output:  [1, 2, 3, 4, 5, 6]
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = CountingSort.order(array, :desc => true)
  #     puts array # Output: [6, 5, 4, 3, 2, 1]
  #
  # OR
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     instance = CountingSort.new(array)
  #     puts instance.array # Output: [1, 2, 3, 4, 5, 6]
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     instance = CountingSort.new(array, :desc => true)
  #     puts instance.array # Output: [6, 5, 4, 3, 2, 1]
  #
  #
  # ### Get Time Complexity:
  # Example:
  #     best = CountingSort::TIME_COMPLEXITY_BEST
  #     worst = CountingSort::TIME_COMPLEXITY_WORST
  #     average = CountingSort::TIME_COMPLEXITY_AVERAGE

  include SortingInterface

  TIME_COMPLEXITY_WORST = "O(n)"
  TIME_COMPLEXITY_AVERAGE = "O(n)"
  TIME_COMPLEXITY_BEST = "O(n)"
  SPACE_COMPLEXITY = "O(k+n)"

  attr_reader :array, :desc, :k

  # For more on k variable, read on counting sort
  # k indicates that every number in the container is in the range (0, k)
  # where k is smaller than n, the container length
  def initialize array, k, desc=false
    unless array.is_a? Enumerable
      raise "Please provide an array or other Enumerable"
    end
    unless (array.all? {|item| item.is_a? Comparable})
      raise "All objects must implement Comparable"
    end
    @array = array
    @desc = desc
    @k = k
    self.sort
  end

  def self.order array, k, desc=false
    instance = CountingSort.new array, k, desc=desc
    instance.array
  end

  protected
  def sort
    n = array.length
    counting_sort array, k
  end

  def is_desc?
    @desc
  end



  def counting_sort array, k
    n = array.length
    counting_array = Array.new k, 0
    for i in 0...n
      counting_array[array[i]] += 1
    end

    idx = 0
    comparison = is_desc? ? ((k-1).downto 0) : 0...k
    for i in comparison
      while counting_array[i] > 0
        array[idx] = i
        counting_array[i] -= 1
        idx += 1
      end
    end


  end


end