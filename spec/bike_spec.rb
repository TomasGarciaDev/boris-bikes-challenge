# frozen_string_literal: true

require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
end
