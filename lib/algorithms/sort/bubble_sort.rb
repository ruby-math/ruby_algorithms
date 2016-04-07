class BubbleSort
  # Important Characteristics
  # 1. Compares all the elements one by one and sort them based on their values
  # 2. Called bubble sort because each iteration the smaller element in the list bubles up towards the first place,
  # just like a water bubble rises up to the water surface
  # 3. In Bubble Sort, n-1 comparisons done in 1st pass, n-2 in 2nd pass
  # Complexity:
  #     (n - 1) + (n - 2) + (n - 3) + ... 3 + 2 + 1
  #     Sum  = n(n-1)/2
  #     i.e O(n^2)
  # 4. Best case: O(n) when list is already sorted
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = BubbleSort.order(array)
  #     puts array # Output:  [1, 2, 3, 4, 5, 6]
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = BubbleSort.order(array, :desc => true)
  #     puts array # Output: [6, 5, 4, 3, 2, 1]
  #
  # OR
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     bubble = BubbleSort.new(array)
  #     puts bubble.array # Output: [1, 2, 3, 4, 5, 6]
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     bubble = BubbleSort.new(array, :desc => true)
  #     puts bubble.array # Output: [6, 5, 4, 3, 2, 1]
  #
  #
  # ### Get Time Complexity:
  # Example:
  #     best = BubbleSort::TIME_COMPLEXITY_BEST
  #     worst = BubbleSort::TIME_COMPLEXITY_WORST
  #     average = BubbleSort::TIME_COMPLEXITY_AVERAGE

  TIME_COMPLEXITY_WORST = "O(n^2)"
  TIME_COMPLEXITY_AVERAGE = "O(n^2)"
  TIME_COMPLEXITY_BEST = "O(n)"
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
    instance = BubbleSort.new array, desc=desc
    instance.array
  end

  protected
  def sort
    bubble_sort
  end

  def is_desc?
    @desc
  end

  def bubble_sort
    array = @array
    for i in 1...array.length
      (array.length-1).downto i do |j|
        comparison = (is_desc?) ? array[j] > array[j-1] : array[j] < array[j-1]
        if comparison
          swap array, j, j-1
        end
      end

    end
  end

    def swap array, i, j
      array[i], array[j] = array[j], array[i]
    end


end