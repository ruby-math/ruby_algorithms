require 'test_helper'
require 'priority_queue'

class PriorityQueueTest < Minitest::Test

  def setup
    @max_pq = PriorityQueue.new max_heap = true
    @max_pq << 6
    @max_pq << 3
    @max_pq << 2
    @max_pq << 5

    @min_pq = PriorityQueue.new
    @min_pq << 6
    @min_pq << 3
    @min_pq << 2
    @min_pq << 5
  end

  def test_basic_priority_queue_max_heap
    assert_equal(6, @max_pq.pop)
  end

  def test_basic_priority_queue_min_heap
    assert_equal 2, @min_pq.pop
  end


  def test_get_max_for_max_q
    assert_equal(6, @max_pq.getMax)
  end

  def test_get_min_for_max
    assert_equal(2, @max_pq.getMin)
  end

  def test_get_max_in_min_q
    assert_equal(6, @min_pq.getMax)
  end

  def test_get_min_for_min_priority_queue
    assert_equal(2, @min_pq.getMin)
  end

  def test_update_key
    @min_pq.updateKey(0, 10)
    assert_equal(10, @min_pq.getMax)
  end




end