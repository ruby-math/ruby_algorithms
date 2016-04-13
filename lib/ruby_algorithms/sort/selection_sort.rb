require 'sorting_interface'
class SelectionSort
  # Important Characteristics
  # 1. Selects the smallest or largest and then swaps with element right after the last sorted item
  # 2. Time complexity is O(n^2) for all 3 scenarios, worst, base, and average
  # 3. Sorts in place
  # 4. Stable sort
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = SelectionSort.order(array)
  #     puts array # Output:  [1, 2, 3, 4, 5, 6]
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = SelectionSort.order(array, :desc => true)
  #     puts array # Output: [6, 5, 4, 3, 2, 1]
  #
  # OR
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     bubble = SelectionSort.new(array)
  #     puts bubble.array # Output: [1, 2, 3, 4, 5, 6]
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     bubble = SelectionSort.new(array, :desc => true)
  #     puts bubble.array # Output: [6, 5, 4, 3, 2, 1]
  #
  #
  # ### Get Time Complexity:
  # Example:
  #     best = SelectionSort::TIME_COMPLEXITY_BEST
  #     worst = SelectionSort::TIME_COMPLEXITY_WORST
  #     average = SelectionSort::TIME_COMPLEXITY_AVERAGE

  include SortingInterface
  TIME_COMPLEXITY_WORST = "O(n^2)"
  TIME_COMPLEXITY_AVERAGE = "O(n^2)"
  TIME_COMPLEXITY_BEST = "O(n^2)"
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
    instance = SelectionSort.new array, desc=desc
    instance.array
  end

  protected
  def sort
    selection_sort
  end

  def is_desc?
    @desc
  end

  def selection_sort
    n = array.length - 1
    for index in 0..n do
      pos = if is_desc?
        find_maximum array, index, n
      else
        find_minimum array, index, n
            end
      if pos != index
        swap array, index, pos
      end
    end
  end

  def find_minimum container, left, right
    find_minimum_or_maximum container, left, right
  end

  def find_maximum container, left, right
    find_minimum_or_maximum container, left, right, find_max=true
  end

  def find_minimum_or_maximum container, left, right, find_max=false
    selected = left
    comparison_symbol = find_max ? :> : :<
    container[left..right].each_with_index do |item, index|
      if item.send(comparison_symbol, container[selected])
        selected_item = container[selected]
        selected = index + left
      end
    end
    selected
  end


end