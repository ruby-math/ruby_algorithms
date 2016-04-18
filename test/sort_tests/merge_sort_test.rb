require 'test_helper'
require 'merge_sort'
require 'sort_strategy_test'

class MergeSortTest < Minitest::Test

  SORT_STRATEGY = MergeSort
  include SortStrategyTest

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