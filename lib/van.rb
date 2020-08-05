class Van

  attr_reader :garages

  def initialize
    @garages = []
  end

  def takes_broken_bikes(docking_station)
    docking_station.broken_bikes.each do |x|
      @garages.push(x)
    end
    docking_station.bikes.delete_if { |x| x.works == false }
  end

  def returns_working_bikes(docking_station)
    @garages.map{ |x| x.fixed_at_garage }
    while @garages.size > 0
      fixed_bike = @garages.pop
      docking_station.dock(fixed_bike)
    end
  end

end
