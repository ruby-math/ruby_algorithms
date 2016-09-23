require 'byebug'
class Point
  attr_reader :x, :y

  def initialize x, y
    validate_cardinal x, y
    @x = x
    @y = y
  end

  def to_s
    "(#{x},#{y})"
  end

  InspectKey = :__inspect_key__
  # Returns a string containing a human-readable representation of the
  # set. ("#<Set: {element1, element2, ...}>")
  def inspect
    ids = (Thread.current[InspectKey] ||= [])

    if ids.include?(object_id)
      return sprintf('#<%s: (%s, %s)>', self.class, x, y)
    end

    begin
      ids << object_id
      return sprintf('#<%s: (%s, %s)>', self.class, x, y)
    ensure
      ids.pop
    end
  end

  private
  def validate_cardinal x, y
    validate_cardinal_helper x
    validate_cardinal_helper y
  end

  def validate_cardinal_helper x
    unless x.is_a?(Float) || x.is_a?(Integer)
      raise "Cardinal with value #{x} must be a number"
    end
    unless x <= Float::MAX
      raise "Cardinal with value #{x} is too large"
    end
  end



end