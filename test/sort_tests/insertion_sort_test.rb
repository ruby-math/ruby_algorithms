require 'test_helper'
require 'insertion_sort'
class InsertionSortTest < Minitest::Test

  def setup
    @array = [3, 2, 4, 5, 6, 1]
    @valid_arrays_asc = [
            { input: [3, 2, 4, 5, 6, 1], output: [1, 2, 3, 4, 5, 6] },
            { input: [9, 2, 4, 5, 6, 1], output: [1, 2, 4, 5, 6, 9] },
            { input: [0, 2, 4, 5, 6, 1], output: [0, 1, 2, 4, 5, 6] }
    ]

    @valid_arrays_desc = [
            { input: [3, 2, 4, 5, 6, 1], output: [6, 5, 4, 3, 2, 1] },
            { input: [9, 2, 4, 5, 6, 1], output: [9, 6, 5, 4, 2, 1] },
            { input: [0, 2, 4, 5, 6, 1], output: [6, 5, 4, 2, 1, 0] }
    ]
  end

  def teardown
  end

  def test_insertion_initializer
    insertion = InsertionSort.new(@array)
    expected = [1, 2, 3, 4, 5, 6]
    assert_equal(expected, insertion.array)
  end

  def random_parameterized_test_asc
    test_case = @valid_arrays_asc[rand(0..@valid_arrays_asc.length)]
    insertion = InsertionSort.new(test_case[:input])
    assert_equal(test_case[:output], insertion.array)
  end

  def random_parameterized_test_desc
    test_case = @valid_arrays_desc[rand(0..@valid_arrays_desc.length)]
    insertion = InsertionSort.new(test_case[:input], :desc => true)
    assert_equal(test_case[:output], insertion.array)
  end

  def test_insertion_sort_ascending
    actual = InsertionSort.order(@array)
    expected = [1, 2, 3, 4, 5, 6]
    assert_equal expected, actual
  end

  def test_insertion_sort_descending
    actual = InsertionSort.order(@array, :desc => true)
    expected = [6, 5, 4, 3, 2, 1]
    assert_equal expected, actual
  end

  def test_time_complexity_output
    best = InsertionSort::TIME_COMPLEXITY_BEST
    worst = InsertionSort::TIME_COMPLEXITY_WORST
    average = InsertionSort::TIME_COMPLEXITY_AVERAGE
    assert_equal("O(n^2)", worst)
    assert_equal("O(n)", best)
    assert_equal("O(n^2)", average)
  end

end