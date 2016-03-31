module Algorithms
  def self.hi(language = "english")
    translator = DataStructures.new(language)
    translator.hi
  end
end
require 'algorithms/data_structures'
require 'algorithms/sort'
