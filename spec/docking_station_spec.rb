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
end