require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike instance' do
    bike = subject.release_bike
    expect(bike).to be_instance_of(Bike)
  end

  it 'can check if the released bike instance is working?' do
    bike = subject.release_bike
    expect(bike).to be_working
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
end