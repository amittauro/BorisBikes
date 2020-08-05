class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    if @bikes.size < 20
      @bikes << bike
    end
  end

  def release
    if @bikes.size == 0
      return nil
    end
    released_bike = @bikes.pop
    if released_bike.works
      released_bike
    end
  end

  def broken_bikes
    @bikes.select{ |x| x.works == false }
  end
end
