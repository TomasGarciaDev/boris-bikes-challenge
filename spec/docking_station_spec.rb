require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike instance' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq(bike)
  end

  it "can check if the released bike instance is working?" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to be_working
  end

  it 'can dock a bike' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq bike
  end

  it { is_expected.to respond_to(:bike) }

  it 'can see that a bike has been docked' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end

  it "should raise an error if docking station has no bikes" do
    expect { subject.release_bike }.to raise_error "Sorry, this Docking Station is empty"
  end

  it "should raise an error if docking station has already bikes" do
    bike1 = Bike.new
    docking_station = DockingStation.new
    docking_station.dock_bike(bike1)
    bike2 = Bike.new
    expect { docking_station.dock_bike(bike2) }.to raise_error "Sorry, this Docking Station is full"
  end
end