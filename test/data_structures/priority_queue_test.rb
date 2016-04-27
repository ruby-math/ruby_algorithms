require 'test_helper'

require 'priority_queue'

class PriorityQueueTest < Minitest::Test

  def setup
    @pq = PriorityQueue.new
    @pq << 5
    @pq << 3
  end


end