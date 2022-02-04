require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Sorry, this Docking Station is empty" if @bikes.empty?
    @bikes.pop()
  end

  def dock_bike(bike)
     raise "Sorry, this Docking Station is full" if @bikes.length  >= 20
    @bikes << bike
  end
end