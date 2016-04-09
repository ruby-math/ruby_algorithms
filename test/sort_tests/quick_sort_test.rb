require 'test_helper'
require 'quick_sort'

class QuickSortTest < Minitest::Test

  def setup
    @array = [05, 03, 16, 02, 10, 14]
    @valid_arrays_asc = [
        { input: [1], output: [1] },
        { input: [9, 2, 4, 5, 6, 1], output: [1, 2, 4, 5, 6, 9] },
        { input: [0, 2, 4, 5, 6, 1], output: [0, 1, 2, 4, 5, 6] },
    ]

    @valid_arrays_desc = [
        { input: [1], output: [1] },
        { input: [9, 2, 4, 5, 6, 1], output: [9, 6, 5, 4, 2, 1] },
        { input: [0, 2, 4, 5, 6, 1], output: [6, 5, 4, 2, 1, 0] }
    ]
  end

  def teardown
    # Do nothing
  end

  def test_sort_ascending
    actual = QuickSort.order(@array)
    expected = [2, 3, 5, 10, 14, 16]
    assert_equal expected, actual
  end

  def test_that_class_implements_sorting_interface
    assert(QuickSort.ancestors.include?(SortingInterface), msg="Does not implement sorting interface")
  end

  def random_parameterized_test_asc
    test_case = @valid_arrays_asc[rand(0..@valid_arrays_asc.length)]
    actual = QuickSort.order(test_case[:input])
    assert_equal(test_case[:output], actual)
  end

  def random_parameterized_test_desc
    test_case = @valid_arrays_desc[rand(0..@valid_arrays_desc.length)]
    actual = QuickSort.new(test_case[:input], :desc => true)
    assert_equal(test_case[:output], actual)
  end

  def test_sort_descending
    actual = QuickSort.order(@array, :desc => true)
    expected = [16, 14, 10, 5, 3, 2]
    assert_equal expected, actual
  end

  def test_time_complexity_output
    best = QuickSort::TIME_COMPLEXITY_BEST
    worst =  QuickSort::TIME_COMPLEXITY_WORST
    average = QuickSort::TIME_COMPLEXITY_AVERAGE
    space = QuickSort::SPACE_COMPLEXITY

    assert_equal("O(n^2)", worst)
    assert_equal("O(n log n)", best)
    assert_equal("O(n log n)", average)
    assert_equal("O(n log n)", space)


  end
end