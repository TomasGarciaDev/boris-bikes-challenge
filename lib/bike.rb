# frozen_string_literal: true

class Bike
  attr_accessor :condition

  def initialize
    @condition = true
  end

  def working?
    @condition
  end
end
