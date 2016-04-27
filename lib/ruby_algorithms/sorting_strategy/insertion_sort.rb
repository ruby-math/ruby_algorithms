require 'sorting_strategy'
require 'byebug'

class InsertionSort
  #
  # Important Characteristics
  # 1. It has one of the simplest implementations
  # 2. It is efficient for smaller data sets, but very inefficient for larger list
  # 3. Insertion Sort is adaptive, that means it reduces its total number of steps if given a partially sorted list, hence it increases its efficiency
  # 4. It is better than Selection Sort and Bubble Sort algorithms
  # 5. Its space complexity is less; Like Buble Sort, insertion sort also requires a single additional memory space
  # 6. It is Stable, as it does not change the relative order of elements with equal keys
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = InsertionSort.order(array)
  #     puts array # Output:  [1, 2, 3, 4, 5, 6]
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = InsertionSort.order(array, :desc => true)
  #     puts array # Output: [6, 5, 4, 3, 2, 1]
  #
  # OR
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     insertion = InsertionSort.new(array)
  #     puts insertion.array # Output: [1, 2, 3, 4, 5, 6]
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     insertion = InsertionSort.new(array, :desc => true)
  #     puts insertion.array # Output: [6, 5, 4, 3, 2, 1]
  #
  #
  # ### Get Time Complexity:
  # Example:
  #     best = InsertionSort::TIME_COMPLEXITY_BEST
  #     worst = InsertionSort::TIME_COMPLEXITY_WORST
  #     average = InsertionSort::TIME_COMPLEXITY_AVERAGE


  TIME_COMPLEXITY_WORST = "O(n^2)"
  TIME_COMPLEXITY_AVERAGE = "O(n^2)"
  TIME_COMPLEXITY_BEST = "O(n)"
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
    instance = InsertionSort.new array, desc=desc
    instance.array
  end

  protected
  def sort
    insertion_sort
  end

  def is_desc?
    @desc
  end

  # You carry a pointer. This pointer indicates last sorted point
  # You iterate backwards comparing new pointer (i) to all other array points (j)
  # If it is less than/greater than, then place it in its rightful position
  # For descending order, just do the opposite.
  # def insertion_sort
  #   array = @array
  #   for i in 1...array.length
  #     current_no = array[i]
  #     j = i - 1
  #     while j >= 0
  #       comparison = is_desc? ? (current_no > array[j]) : (current_no < array[j])
  #       unless comparison
  #         break
  #       end
  #       array[j+1] = array[j]
  #       j = j - 1
  #     end
  #     array[j+1] = current_no
  #   end
  # end


  def insertion_sort
    array = @array
    for i in 1...array.length
      temp = array[i]
      j = i
      comparison = is_desc? ? :> : :<
      x = i - 1
      while x >= 0
        if temp.send(comparison, array[x])
            array[x + 1] = array[x]
            j = x
            x -= 1
          else
            x -= 1
            break
          end
      end
      array[j] = temp
    end
  end

end