require 'test_helper'
require 'counting_sort'

class CountingSortTest < Minitest::Test

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

    @invalid_array_with_negative_number = [-5, 03, 16, 02, 10, 14]
  end

  def teardown
    # Do nothing
  end

  def test_that_it_gives_error_with_negative_number
    assert_raises RuntimeError do
      CountingSort.order(@invalid_array_with_negative_number, 17)
    end
  end

  def test_that_it_gives_error_if_value_in_array_is_greater_than_or_equal_to_k
    array = [05, 03, 16, 02, 10, 17]
    k = 17
    assert_raises RuntimeError do
      CountingSort.order(array, k)
    end
  end

  def test_sort_ascending
    actual = CountingSort.order(@array, 17)
    expected = [2, 3, 5, 10, 14, 16]
    assert_equal expected, actual
  end

  def test_that_class_implements_sorting_interface
    assert(CountingSort.ancestors.include?(SortingStrategy), msg="Does not implement sorting interface")
  end

  def random_parameterized_test_asc
    test_case = @valid_arrays_asc[rand(0..@valid_arrays_asc.length)]
    actual = CountingSort.order(test_case[:input], 10)
    assert_equal(test_case[:output], actual)
  end

  def random_parameterized_test_desc
    test_case = @valid_arrays_desc[rand(0..@valid_arrays_desc.length)]
    actual = CountingSort.new(test_case[:input], 10, :desc => true)
    assert_equal(test_case[:output], actual)
  end

  def test_sort_descending
    actual = CountingSort.order(@array, 17, :desc => true)
    expected = [16, 14, 10, 5, 3, 2]
    assert_equal expected, actual
  end

  def test_time_complexity_output
    best = CountingSort::TIME_COMPLEXITY_BEST
    worst =  CountingSort::TIME_COMPLEXITY_WORST
    average = CountingSort::TIME_COMPLEXITY_AVERAGE
    space = CountingSort::SPACE_COMPLEXITY

    assert_equal("O(n)", worst)
    assert_equal("O(n)", best)
    assert_equal("O(n)", average)
    assert_equal("O(k+n)", space)


  end
end