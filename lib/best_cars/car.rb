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
  
  def self.set_fuel_economy(fuel_object)
    @fuel_object = fuel_object
    fuel_object.car = self
  end
  
  def self.list_car_info(selected_car)
    puts "\n"
    puts "______________________________________"
    puts "#{selected_car.model} information:"
    puts "______________________________________"
    puts "MPG: #{selected_car.mpg}"
    puts "EPA class: #{selected_car.epa_class}"
    puts "The fuel type is: #{selected_car.fuel_type}"
    puts "\n"
  end
  
  def self.list_range_cost(selected_car)
    # if selected_car.fuel_object == nil
    BestCars::Scraper.scrape_range_cost(selected_car)
    fuel = selected_car.fuel_object
   
    puts "\n"
    puts "Total range: #{fuel.range} miles"
    puts "\n"
    puts "Annual fuel cost for both electricity and gasoline: #{fuel.cost}"
    puts "\n"
  end

end