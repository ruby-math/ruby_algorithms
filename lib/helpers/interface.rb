module Interface
  def method(name)
    define_method(name) { |*args|
      raise "interface method #{name} not implemented"
    }
  end
end