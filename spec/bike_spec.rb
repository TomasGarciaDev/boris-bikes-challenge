# frozen_string_literal: true

require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it 'can set to working or not (true or false)' do
    bike = Bike.new
    bike.condition = false
    expect(bike.working?).to eq(false)
  end
end
