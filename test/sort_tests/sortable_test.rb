require 'test_helper'
require 'sortable'

class SortableTest < Minitest::Test

  def setup
    @sortable = Sortable.new([3, 2, 4, 5, 6, 1])
  end

  def teardown
    # Do nothing
  end

  def test_sorting
    skip("To be implemented")
    # @sortable.sort()
    # @sortable.sort(:worst_case => "lgn")
    # @sortable.bubble_sort()
    # @sortable.selection_sort()
    # @sortable.quick_sort()
    # @sortable.merge_sort()
    # @sortable.heap_sort()
  end
  def test_time_complexity
    skip("To be implemented")
    # Sortable.time_complexity(Sortable::MERGE_SORT)
  end
  def test_generic_sort
    skip("To be implemented")
    # @sortable.sort
  end

  def test_insertion_sort_in_place
    @sortable.insertion_sort!
    expected = Sortable.new [1, 2, 3, 4, 5, 6]
    assert_same(expected, @sortable)
  end


end