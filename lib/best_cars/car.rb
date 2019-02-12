class BestCars::Car 
  attr_accessor :model, :epa_class, :mpg, :fuel_type, :url 
  attr_reader :fuel_object
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def self.save
    @@all << self
    self
  end
  
  def initialize(car_hash)
    car_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end 
    
    @fuel_object = nil
    @@all << self
  end
  
  def set_fuel_economy(fuel_object)
    @fuel_object = fuel_object
    fuel_object.car = self
  end
  
  def set_fuel_type(fuel_type_object)
    @fuel_type = fuel_type_object
    fuel_type_object.car = self
  end
end