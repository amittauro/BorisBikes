require './lib/bike.rb'
require './lib/docking_station.rb'
# Objects | Messages
# Bike
# DockingStation | dock(bike), release
#
# As a member of the public
# So I can return bikes I’ve hired
# I want to dock my bike at the docking station

it 'docks my bike' do
  #set up
  bike = Bike.new
  docking_station = DockingStation.new

  # execute (subject under test: docking_station)
  result = docking_station.dock(bike)

  #verify
  assert_equals(result, [bike])
end


# As a member of the public,
# So that I can use a bike,
# I’d like a docking station to release a bike.

it 'releases my bike' do
  # set up
  bike = Bike.new
  docking_station = DockingStation.new
  docking_station.dock(bike)

  # execute
  result = docking_station.release

  # verify
  assert_equals(result, bike)
end
