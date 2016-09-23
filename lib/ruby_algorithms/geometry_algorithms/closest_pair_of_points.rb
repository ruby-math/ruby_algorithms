require 'point'
class ClosestPairOfPoints

  attr_reader :closest_pairs

  def self.parse_file file_path
    points = []
    File.open file_path do |file|
      file.each do | row |
        items = row.split(" ")
        x = items[0].to_i
        y = items[1].to_i
        point = Point.new x, y
        points << point
      end
    end
    new *points
  end


  def initialize *arr
    validate_array_size arr
    arr.each do |point|
      validate_point point
    end
    closest_pair arr
  end

  private
  def closest_pair arr
    points_sorted_by_x = sort_by_x arr.clone
    points_sorted_by_y = sort_by_y arr.clone
    length = points_sorted_by_x.length - 1
    @closest_pairs = closest_pair_recursive points_sorted_by_x, points_sorted_by_y, 0, length
  end

  def closest_pair_recursive arr, points_sorted_by_y, first, last
    size = arr[first..last].size

    return recursive_helper({}, arr[first], arr[last]) if (size == 2)
    return closest_of_3_points(arr[first], arr[last], arr[first + 1]) if (size == 3)

    middle = ((first + last) / 2).floor
    closest_of_left = closest_pair_recursive arr, points_sorted_by_y, first, middle
    closest_of_right = closest_pair_recursive arr, points_sorted_by_y, middle + 1, last
    sigma = (closest_of_left[:distance] < closest_of_right[:distance]) ? closest_of_left : closest_of_right
    closest_of_middle = closest_of_middle points_sorted_by_y, sigma[:distance], middle
    return sigma if (closest_of_middle.empty?)
    sigma[:distance] < closest_of_middle[:distance] ? sigma : closest_of_middle
  end


  def closest_of_middle arr, sigma, middle
    new_arr = get_points_in_array arr, middle, sigma
    closest_pair = {}
    new_arr.each_with_index do |point, index|
      i = index + 1;
      seventh_step = index + 7
      while (i < seventh_step && i < new_arr.size)
          closest_pair = recursive_helper closest_pair, point, new_arr[i]
          i += 1
      end

    end
    closest_pair
  end

  def get_points_in_array arr, l, sigma
    arr.select { |point| point.x <= l - sigma || point.x <= l + sigma }
  end


  def closest_of_3_points point1, point2, point3
      closest_pair = recursive_helper({}, point1, point2)
      closest_pair = recursive_helper(closest_pair, point1, point3)
      recursive_helper(closest_pair, point2, point3)
  end

  def recursive_helper closest_pair, point1, point2
    distance = distance(point1, point2)
    if (closest_pair == {} || distance < closest_pair[:distance])
      closest_pair =  {:point1 => point1, :point2 => point2, :distance => distance}
    end
    closest_pair
  end

  def distance point1, point2
    value = (point2.x - point1.x) ** 2 + (point2.y - point1.y) ** 2
    Math.sqrt(value)
  end

  def sort_by_x points
    merge_sort(points, 0, points.length - 1) {|item| item.x}
  end

  def sort_by_y points
    merge_sort(points, 0, points.length - 1) {|item| item.y}
  end

  def merge_sort array, p, r, &block
    if p < r
      q = ((p + r) / 2).floor
      merge_sort(array, p, q, &block)
      merge_sort(array, q + 1, r, &block)
      merge(array, p, q, r, &block)
    end
  end

  def merge array, p, q, r, &block
    n1 = q - p + 1
    n2 = r - q
    left_array = []
    right_array = []

    for i in 1..n1
      left_array[i] = array[p + i - 1]
    end

    for j in 1..n2
      right_array[j] = array[q + j]
    end

    i = 1
    j = 1
    for k in p..r

      if i >= left_array.length && (j < right_array.length)
        array[k] = right_array[j]
        j = j + 1
        next
      elsif j >= right_array.length && (i < left_array.length)
        array[k] = left_array[i]
        i = i + 1
        next
      elsif j >= right_array.length && i >= left_array.length
        break
      end

      comparison_result = if block_given?
                            yield(left_array[i]) <= yield(right_array[j])
                          else
                            left_array[i] <= right_array[j]
                          end
      if comparison_result
        array[k] = left_array[i]
        i += 1
      else
        array[k] = right_array[j]
        j += 1
      end
    end
    array
  end


  def validate_point point
    unless point.is_a? Point
      raise "Please input only valid points"
    end
  end

  def validate_array_size arr
    unless arr.size >= 2
      raise "Array size must be greater than or equal to 2"
    end
  end

end


