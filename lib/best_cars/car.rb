class BestCars::Car 
  attr_accessor :model, :epa_class, :mpg, :fuel_type, :url 
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def initialize(car_hash)
    car_hash.each do |key, value|
      self.send("#{key}=", value)
    end 
    
    @@all << self
  end
end