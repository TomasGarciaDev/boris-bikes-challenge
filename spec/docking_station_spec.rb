# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike instance' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq(bike)
  end

  it 'can check if the released bike instance is working?' do
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

  it 'should raise an error if docking station has no bikes' do
    expect { subject.release_bike }.to raise_error 'Sorry, this Docking Station is empty'
  end

  it 'should should raise an error when station is full' do
    subject.capacity.times { subject.dock_bike(Bike.new) }
    expect { subject.dock_bike(Bike.new) }.to raise_error 'Sorry, this Docking Station is full'
  end

  it 'can set the capacity of the Docking Station' do
    docking_station = DockingStation.new(30)
    expect(docking_station.capacity).to eq 30
  end

  it 'can set the capacity of the Docking Station second test' do
    docking_station = DockingStation.new(30)
    30.times { docking_station.dock_bike(Bike.new)}
    expect{ docking_station.dock_bike(Bike.new) }.to raise_error 'Sorry, this Docking Station is full'
  end

  it 'has a default of capacity of 20' do
    expect(subject.capacity).to be DockingStation::DEFAULT_CAPACITY
  end
end

describe DockingStation do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock_bike(bike)
    end
    expect{ subject.dock_bike(bike) }.to raise_error 'Sorry, this Docking Station is full'
  end
end