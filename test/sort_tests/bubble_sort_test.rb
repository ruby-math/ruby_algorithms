require 'test_helper'
require 'bubble_sort'
require 'sort_strategy_test'

class BubbleSortTest < Minitest::Test

  SORT_STRATEGY = BubbleSort
  include SortStrategyTest

  def test_time_complexity_output
    best = BubbleSort::TIME_COMPLEXITY_BEST
    worst =  BubbleSort::TIME_COMPLEXITY_WORST
    average = BubbleSort::TIME_COMPLEXITY_AVERAGE
    assert_equal("O(n^2)", worst)
    assert_equal("O(n)", best)
    assert_equal("O(n^2)", average)
  end
end