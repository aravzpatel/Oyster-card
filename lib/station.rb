class Station
  attr_reader :name, :zone


  def initialize(name, zone)
    @name = name
    @zone = zone
  #liverpool = Station.new("Liverpool Street", 1)
  end
end