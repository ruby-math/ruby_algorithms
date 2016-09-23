require 'byebug'
module SubsetSum


  def subset_exists_for_sum?(array, t)
    validate_array array
    validate_t t


    default_value = "*"
    n = array.size

    k = Array.new(n+1) {Array.new(t+1,default_value)}
    k[0][0] = Set.new

    for i in 0...n
      for s in 0..t
        if k[i][s] != "*"

          if k[i+1][s] == "*"
            k[i+1][s] = k[i][s]
          end

          next_row_column = s + array[i]
          if next_row_column <= t
              k[i + 1][next_row_column] = k[i][s].union [array[i]]
          end
        end
      end
    end

    k[n][t] != "*"
  end

  private

  def validate_t t
    unless t.is_a? Integer
      raise "Please provide an integer"
    end
    unless t > 0
      raise "Please provide variable greater than 0"
    end
  end

  def validate_array array
    unless array.size >= 1
      raise "Please provide an error with at least one element"
    end
  end


end