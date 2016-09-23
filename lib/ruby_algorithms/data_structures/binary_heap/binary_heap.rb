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


  def bubble_down(array, index)
    left = 2 * index + 1
    right = 2 * index + 2

    heapsize = array.size

    #return if we reach the last element
    return if index >= heapsize - 1

    #comparison, if min heap, then child index is greater than, if max heap, then child index is less than
    comparison = is_min_heap? ? :> : :<
    # or if the parent is already greater/less than (in min or max) than the child
    return if array[left].send(comparison, array[index]) && array[right].send(comparison, array[index])

    # largest if max_heap
    # smallest if min_heap
    priority = index

    # comparison, now if min heap, then find smallest priority using < else find largest priority using >
    comparison = is_min_heap? ? :<= : :>=
    if (left < heapsize && array[left].send(comparison, array[index]))
      priority = left
    end

    if (right < heapsize && array[right].send(comparison, array[priority]))
      priority = right
    end

    #and keep bubbling down
    if priority != index
      swap array, index, priority
      bubble_down(array, priority)
    end
  end

  def bubble_up (array, index)
    parent_index = (index/2).floor

    #return if we reach the root element
    return if index <= 0
    return if index >= array.size

    parent_should_be_comparison = is_min_heap? ? :<= : :>=
    # or if the parent is already greater/less than (in min or max) than the child
    return if array[parent_index].send(parent_should_be_comparison, array[index])

    # otherwise we exchange he child with the parent
    swap(array, index, parent_index)

    #and keep bubbling up
    bubble_up(array, parent_index)
  end



end