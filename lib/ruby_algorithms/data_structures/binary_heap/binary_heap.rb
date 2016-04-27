require 'byebug'
module BinaryHeap

  def is_min_heap?
    @is_min_heap
  end

  def is_max_heap?
    !@is_min_heap
  end

  private

  def build_heap array
    n = array.length
    half = (n/2).floor - 1
    for i in half.downto 0
      heapify array, i, n
    end
  end

  def heapify array, parent, heapsize
    left = 2 * parent + 1
    right = 2 * parent + 2

    # largest if max_heap
    # smallest if min_heap
    priority = parent

    comparison = is_min_heap? ? :< : :>
    if (left < heapsize && array[left].send(comparison, array[parent]))
      priority = left
    end

    if (right < heapsize && array[right].send(comparison, array[priority]))
      priority = right
    end

    if priority != parent
      swap array, parent, priority
      heapify(array, priority, heapsize)
    end
  end


  def bubble_down (array, i)
    heapify array, i, array.size

  end

  def bubble_up (array, index)
    parent_index = (index/2).floor

    #return if we reach the root element
    return if index <= 0
    return if index >= array.size

    parent_should_be_comparison = is_min_heap? ? :< : :>
    # or if the parent is already greater/less than (in min or max) than the child
    return if array[parent_index].send(parent_should_be_comparison, array[index])

    # otherwise we exchange he child with the parent
    swap(array, index, parent_index)

    #and keep bubbling up
    bubble_up(array, parent_index)
  end



end