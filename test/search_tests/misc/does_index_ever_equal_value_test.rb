require 'test_helper'
require 'does_index_ever_equal_value'

class DoesIndexEverEqualValueTest< Minitest::Test
  include DoesIndexEverEqualValue

  def setup
    @array = [1, 2, 3]
    @arr2 =  [0, 2, 3, 4]
    @arr3 = [0, 1, 4, 5]
  end


  def test_false_assertion
    assert !does_index_ever_equal_value(@array)
  end

  def test_true_assertion
    assert does_index_ever_equal_value(@arr3)
  end
end