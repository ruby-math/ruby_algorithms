require 'test_helper'
require 'heap_sort'
require 'sort_strategy_test'


class HeapSortTest < Minitest::Test

  SORT_STRATEGY = HeapSort
  include SortStrategyTest

  def test_time_complexity_output
    best = HeapSort::TIME_COMPLEXITY_BEST
    worst =  HeapSort::TIME_COMPLEXITY_WORST
    average = HeapSort::TIME_COMPLEXITY_AVERAGE
    space = HeapSort::SPACE_COMPLEXITY

    assert_equal("O(n log n)", worst)
    assert_equal("O(n log n)", best)
    assert_equal("O(n log n)", average)
    assert_equal("O(n)", space)


  end
end