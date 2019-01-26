class BestCars::Fuel
attr_accessor :car, :range, :cost
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(fuel_hash)
    fuel_hash.each do |attribute_key, attribute_value|
      self.send("#{attribute_key}=", attribute_value)
    end
    
    @@all << self
    
  end
  
  def list_range_cost(selected_car)
    fuel = find_fuel_by_model(selected_car)
    
    puts "\n"
    puts "Total range: #{fuel.range} miles"
    puts "\n"
    puts "Annual fuel cost for both electricity and gasoline: #{fuel.cost}"
    puts "\n"
  end
  
  def find_fuel_by_model(selected_car)
    self.all.each.include?(selected_car.model)
end
  