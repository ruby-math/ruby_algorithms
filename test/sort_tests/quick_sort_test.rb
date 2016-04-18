require 'test_helper'
require 'quick_sort'
require 'sort_strategy_test'

class QuickSortTest < Minitest::Test

  SORT_STRATEGY = QuickSort
  include SortStrategyTest

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