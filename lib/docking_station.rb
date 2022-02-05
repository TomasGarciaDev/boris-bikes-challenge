# frozen_string_literal: true

require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'Sorry, this Docking Station is empty' if empty?

    @bikes.pop
  end

  def dock_bike(bike)
    raise 'Sorry, this Docking Station is full' if full?

    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
