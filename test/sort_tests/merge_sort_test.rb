require 'test_helper'
require 'merge_sort'

class MergeSortTest < Minitest::Test

  def setup
    @array = [3, 2, 4, 5, 6, 1]
  end

  def teardown
    # Do nothing
  end

  def test_sort_ascending
    actual = MergeSort.order(@array)
    expected = [1, 2, 3, 4, 5, 6]
    assert_equal expected, actual
  end

  def test_sort_descending
    actual = MergeSort.order(@array, :desc => true)
    expected = [6, 5, 4, 3, 2, 1]
    assert_equal expected, actual
  end
end