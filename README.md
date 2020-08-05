# Part 1
As a member of the public
So I can return bikes I’ve hired
I want to dock my bike at the docking station

As a member of the public,
So that I can use a bike,
I’d like a docking station to release a bike.

Nouns
Member
Public
Bike
Bikes
Docking Station

Verbs
Return
Hired
Dock -
Want
Use
Release -
Like

Objects | Messages
Bike
DockingStation | dock(bike), release


# Part 2
As a member of the public,
So that I am not confused and charged unnecessarily,
I’d like docking stations not to release bikes when there are none available.

As a system maintainer,
So that I can control the distribution of bikes,
I’d like docking stations not to accept more bikes than their capacity, which is by default 20.

Objects | Messages
bike
docking station | release, dock(bike

# Part 3
As a member of the public,
So that I can use a good bike,
I’d like to see if a bike is working

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I’d like to report a bike as broken when I return it.

As a system maintainer,
So that I can manage broken bikes and not disappoint users,
I’d like docking stations not to release broken bikes.

As a system maintainer,
So that I can manage broken bikes and not disappoint users,
I’d like docking stations to accept returning bikes (broken or not).

Objects | Messages
bike | bike_works? (boolean), report(bike)
docking_station | release, report_broken?(bike) (boolean)

# Extension
As a system maintainer,
So that I can manage broken bikes and not disappoint users,
I’d like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a system maintainer,
So that I can manage broken bikes and not disappoint users,
I’d like vans to collect working bikes from garages and distribute them to docking stations.

Objects | Messages
vans | takes_broken_bikes from docking_station (array), collects_working_bikes from garages and returns to docking_station
Bikes
garages
