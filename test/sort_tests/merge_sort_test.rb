require 'test_helper'
require 'merge_sort'

class MergeSortTest < Minitest::Test

  def setup
    @array = [3, 2, 4, 5, 6, 1]
    @valid_arrays_asc = [
        { input: [1], output: [1] },
        { input: [9, 2, 4, 5, 6, 1], output: [1, 2, 4, 5, 6, 9] },
        { input: [0, 2, 4, 5, 6, 1], output: [0, 1, 2, 4, 5, 6] }
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
    actual = MergeSort.order(@array)
    expected = [1, 2, 3, 4, 5, 6]
    assert_equal expected, actual
  end

  def random_parameterized_test_asc
    test_case = @valid_arrays_asc[rand(0..@valid_arrays_asc.length)]
    insertion = MergeSort.new(test_case[:input])
    assert_equal(test_case[:output], insertion.array)
  end

  def random_parameterized_test_desc
    test_case = @valid_arrays_desc[rand(0..@valid_arrays_desc.length)]
    insertion = MergeSort.new(test_case[:input], :desc => true)
    assert_equal(test_case[:output], insertion.array)
  end

  def test_sort_descending
    actual = MergeSort.order(@array, :desc => true)
    expected = [6, 5, 4, 3, 2, 1]
    assert_equal expected, actual
  end

  def test_time_complexity_output
    best = MergeSort::TIME_COMPLEXITY_BEST
    worst =  MergeSort::TIME_COMPLEXITY_WORST
    average = MergeSort::TIME_COMPLEXITY_AVERAGE
    space = MergeSort::SPACE_COMPLEXITY
    assert_equal("O(n log(n))", worst)
    assert_equal("O(n log(n))", best)
    assert_equal("O(n log(n))", average)
    assert_equal("O(n)", space)
  end
end