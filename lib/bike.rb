class Bike

  attr_reader :works

  def initialize
    @works = true
  end

  def report_broken
    @works = false
  end

  def fixed_at_garage
    @works = true
  end

end
