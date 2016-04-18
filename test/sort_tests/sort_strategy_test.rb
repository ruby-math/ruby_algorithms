require 'test_helper'
require 'sorting_strategy'

module SortStrategyTest

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

  def sort_strategy
      main_class = self.is_a?(Module) ? self : self.class
      main_class::SORT_STRATEGY
  end

  def test_that_class_implements_sorting_interface
    assert(sort_strategy.ancestors.include?(SortingStrategy), msg="Does not implement sorting strategy interface")
  end

  def test_sort_ascending
    actual = sort_strategy.order(@array)
    expected = [1, 2, 3, 4, 5, 6]
    assert_equal expected, actual
  end

  def random_parameterized_test_asc
    test_case = @valid_arrays_asc[rand(0..@valid_arrays_asc.length)]
    actual = sort_strategy.order(test_case[:input])
    assert_equal(test_case[:output], actual)
  end

  def random_parameterized_test_desc
    test_case = @valid_arrays_desc[rand(0..@valid_arrays_desc.length)]
    actual = sort_strategy.new(test_case[:input], :desc => true)
    assert_equal(test_case[:output], actual)
  end

  def test_sort_descending
    actual = sort_strategy.order(@array, :desc => true)
    expected = [6, 5, 4, 3, 2, 1]
    assert_equal expected, actual
  end
end