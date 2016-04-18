require 'test_helper'
require 'selection_sort'
require 'sort_strategy_test'

class SelectionSortTest < Minitest::Test

  SORT_STRATEGY = SelectionSort
  include SortStrategyTest

  def test_time_complexity_output
    best = SelectionSort::TIME_COMPLEXITY_BEST
    worst =  SelectionSort::TIME_COMPLEXITY_WORST
    average = SelectionSort::TIME_COMPLEXITY_AVERAGE
    assert_equal("O(n^2)", worst)
    assert_equal("O(n^2)", best)
    assert_equal("O(n^2)", average)
  end
end