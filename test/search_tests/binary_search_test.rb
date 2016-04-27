require 'test_helper'
require 'binary_search'
class BinarySearchTest < Minitest::Test

  def setup
    @array = [1, 2, 3, 5, 8, 9, 20]
  end

  def find_middle_element_in_array
    assert_equal 4, BinarySearch.find(@array, 8)
  end

  def find_first_element_in_array
    assert_equal 0, BinarySearch.find(@array, 1)
  end

  def find_last_element_in_array
    assert_equal 6, BinarySearch.find(@array, 20)
  end

  def find_element_not_in_array
    assert_equal -1, BinarySearch.find(@array, 24)
  end

end