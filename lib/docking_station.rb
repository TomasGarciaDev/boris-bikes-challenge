require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise "Sorry, this Docking Station is empty" if @bike.nil?
    @bike
  end

  def dock_bike(bike)
     raise "Sorry, this Docking Station is full" if @bike
    @bike = bike
  end
end