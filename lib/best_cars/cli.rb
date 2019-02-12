class BestCars::CLI 
  
  def start 
    greeting
    BestCars::Scraper.scrape_cars
    select_car_info
  end
  
  def greeting
    puts "\n"
    puts "------------------------------------------------"
    puts "Here are the top 8 fuel-efficient cars of 2019:"
    puts "------------------------------------------------"
    puts "\n"
  end
  
  def list_cars
    BestCars::Car.all.each.with_index(1) do |car, index|
      puts "#{index}. #{car.model}"
    end
  end
  
  def select_car_info
    list_cars
    puts "\n"
    puts "Select the number car you want more information about."
    puts "\n"
    print "Enter a number between 1 and 8 >  "
    
    number = gets.strip
    index = number.to_i - 1
    
    until index.between?(0, 7)
      puts "Invalid choice. Select a number between 1 and 8."
      number = gets.strip
      index = number.to_i - 1
    end
    
    selected_car = BestCars::Car.all[index]
    list_car_info(selected_car)
    get_more_info(selected_car)
  end
  
  def list_car_info(selected_car)
    puts "\n"
    puts "--------------------------------------"
    puts "#{selected_car.model} Information:"
    puts "--------------------------------------"
    puts "\n"
    puts "MPG: #{selected_car.mpg}"
    puts "EPA class: #{selected_car.epa_class}"
    puts "The fuel type is: #{selected_car.fuel_type}"
    puts "\n"
    puts "--------------------------------------"
  end
  
  def list_range_cost(selected_car)
    BestCars::Scraper.scrape_range_cost(selected_car) if selected_car.fuel_object == nil
    
    fuel = selected_car.fuel_object
    puts "\n"
    puts "--------------------------------------"
    puts "#{selected_car.model} Fuel Economy Information:"
    puts "--------------------------------------"
    puts "\n"
    puts "Total range: #{fuel.range} miles"
    puts "\n"
    puts "Annual fuel cost for both electricity and gasoline: #{fuel.cost}"
    puts "\n"
    puts  "--------------------------------------"
  end
  
  def get_more_info(selected_car)
    puts "Would you like to know about the range and annual fuel cost of this car?"
    puts "\n"
    print "Enter Y or N > "
    
    input = gets.strip.upcase
    until [ "Y", "YES", "N", "NO"].include?(input)
      puts "Please enter Y or N >"
      input = gets.strip.upcase
    end
    
    list_range_cost(selected_car) if input == "Y" || input == "YES"
    exit_or_restart
  end
  
  def exit_or_restart
    puts "\n"
    puts "Would you like to select another car?"
    print "Enter Y or N > "
    
    input = gets.strip.upcase
    until [ "Y", "YES", "N", "NO"].include?(input)
      puts "Please enter Y or N >"
      input = gets.strip.upcase
    end
    
    if input == "Y" || input == "YES"
      select_car_info
    else
      puts "\n"
      puts "Thank you! You have exited the program."
    end
  end
end  