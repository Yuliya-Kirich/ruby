# frozen_string_literal: true

require_relative '../../10_issue/manager/acсessors'
require_relative '../../10_issue/station'

RSpec.describe Station do
  it 'has method attr_accessor_with_history' do
    station = Station.new('Gh')
    expect(station.daily = 5).to eq(5)
  end
  it 'attr_accessor_with_history takes 2 arguments' do
    station = Station.new('Gh')
    expect(station.daily = 5).to eq(5)
    expect(station.holidays = 6).to eq(6)
  end
  it 'attr_accessor_with_history takes 3 arguments' do
    station = Station.new('Gh')
    expect(station.daily = 5).to eq(5)
    expect(station.holidays = 6).to eq(6)
    expect(station.reserve = 7).to eq(7)
  end
  it 'attr_accessor_with_history updates the argument value' do
    station = Station.new('Gh')
    expect(station.daily = 5).to eq(5)
    expect(station.holidays = 6).to eq(6)
    expect(station.reserve = 7).to eq(7)
    expect(station.daily = 10).to eq(10)
  end
  it 'attr_accessor_with_history stores arguments' do
    station = Station.new('Gh')
    station.daily = 5
    station.holidays = 6
    station.reserve = 7,8,9,10,'jkjk'
    expect(station.instance_variables).to eq([:@name, :@trains_at_station, :@daily, :@holidays, :@reserve])
  end
  it 'bla bla' do
    station = Station.new('Gh')
    station.public_methods
    expect(station.abc).to eq(:abc_history)
    expect(station.abc_history = 1).to eq(1)
  end

end
