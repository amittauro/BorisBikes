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

it 'doesnt release bikes if there are none available' do
  # set up
  docking_station = DockingStation.new
  bike = Bike.new

  # execute
  result = docking_station.release

  # verify
  assert_equals(result, nil)
end

it 'doesnt dock more than 20 bikes' do
  # set up
  docking_station = DockingStation.new
  bike = Bike.new

  # execute
  25.times do
    docking_station.dock(bike)
  end

  # verify
  assert_equals(docking_station.bikes.size, 20)
end

it 'checks that bikes works' do
  # set up
  bike = Bike.new

  # execute
  result = bike.works

  # verify
  assert_equals(result, true)
end

it 'reports bike as broken when returned' do
  # set up
  bike = Bike.new

  # execute
  bike.report_broken

  # verify
  assert_equals(bike.works, false)
end

it 'dont release broken bikes' do
  # set up
  bike = Bike.new
  docking_station = DockingStation.new
  bike.report_broken
  docking_station.dock(bike)

  # execute
  result = docking_station.release

  # verify
  assert_equals(result, nil)
end

it 'accepts broken bikes' do
  # set up
  bike = Bike.new
  docking_station = DockingStation.new
  bike.report_broken

  # execute
  result = docking_station.dock(bike)

  # verify
  assert_equals(result, [bike])
end

it 'collects broken bikes and delivers them to to garages' do
  # set up
  bike = Bike.new
  docking_station = DockingStation.new
  bike.report_broken
  docking_station.dock(bike)
  van = Van.new

  # execute
  van.takes_broken_bikes(docking_station)

  # verify
  assert_equals(van.garages, [bike])
end

it 'collects working bikes from garages and delivers them to docking station' do
  # set up
  bike1 = Bike.new
  bike2 = Bike.new
  bike3 = Bike.new
  docking_station = DockingStation.new
  bike1.report_broken
  bike2.report_broken
  docking_station.dock(bike1)
  docking_station.dock(bike2)
  docking_station.dock(bike3)
  van = Van.new
  van.takes_broken_bikes(docking_station)

  # execute
  van.returns_working_bikes(docking_station)

  # verify
  assert_equals(docking_station.bikes.size, 3)
end
