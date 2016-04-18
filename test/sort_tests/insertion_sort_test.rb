require 'test_helper'
require 'insertion_sort'
require 'sort_strategy_test'

class InsertionSortTest < Minitest::Test

  SORT_STRATEGY = InsertionSort
  include SortStrategyTest

  def test_time_complexity_output
    best = InsertionSort::TIME_COMPLEXITY_BEST
    worst = InsertionSort::TIME_COMPLEXITY_WORST
    average = InsertionSort::TIME_COMPLEXITY_AVERAGE
    assert_equal("O(n^2)", worst)
    assert_equal("O(n)", best)
    assert_equal("O(n^2)", average)
  end

end