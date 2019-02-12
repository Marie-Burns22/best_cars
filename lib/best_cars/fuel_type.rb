class BestCars::FuelType
attr_accessor :fuel_type
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(fuel_type)
    @fuel_type = fuel_type
  
    @@all << self
  end
end
  