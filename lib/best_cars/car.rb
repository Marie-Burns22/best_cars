class BestCars::Car 
  attr_accessor :model, :epa_class, :mpg, :fuel_type, :url 
  attr_reader :fuel
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def initialize(car_hash)
    car_hash.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end 
    fuel
    @@all << self
  end
  
  def list_car_info(selected_car)
    puts "\n"
    puts "______________________________________"
    puts "#{selected_car.model} information:"
    puts "______________________________________"
    puts "MPG: #{selected_car.mpg}"
    puts "EPA class: #{selected_car.epa_class}"
    puts "The fuel type is: #{selected_car.fuel_type}"
    puts "\n"
  end
  
end