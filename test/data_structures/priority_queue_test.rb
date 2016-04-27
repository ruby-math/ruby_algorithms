require 'test_helper'

require 'priority_queue'

class PriorityQueueTest < Minitest::Test

  def setup
    @max_pq = PriorityQueue.new
    @min_pq = PriorityQueue.new min_heap = true
  end

  def test_basic_priority_queue_max_heap
    @max_pq << 6
    @max_pq << 3
    @max_pq << 2
    @max_pq << 5
    assert_equal(6, @max_pq.pop)
  end

  def test_basic_priority_queue_min_heap
    @min_pq << 6
    @min_pq << 3
    @min_pq << 2
    @min_pq << 5
    assert_equal 2, @min_pq.pop
  end


end