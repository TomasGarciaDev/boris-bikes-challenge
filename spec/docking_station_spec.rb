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
    subject.dock_bike(bike)
    expect(subject.bikes[-1]).to eq bike
  end

  it { is_expected.to respond_to(:bikes) }

  it 'can see that a bike has been docked' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes[-1]).to eq bike
  end

  it "should raise an error if docking station has no bikes" do
    expect { subject.release_bike }.to raise_error "Sorry, this Docking Station is empty"
  end

  it "should have a maximum capacity of 20 bikes" do 
    DockingStation::DEFAULT_CAPACITY.times do
      subject.dock_bike(Bike.new)
    end
    expect {subject.dock_bike(Bike.new) }.to raise_error "Sorry, this Docking Station is full"
  end
end