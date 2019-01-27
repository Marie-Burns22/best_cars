class BestCars::Fuel
attr_accessor :car, :range, :cost
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(fuel_attributes)
    fuel_attributes.each do |attribute_key, attribute_value|
      self.send("#{attribute_key}=", attribute_value)
    end
    
    @@all << self
    
  end
  
  
  

end
  