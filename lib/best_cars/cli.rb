class BestCars::CLI 
  
  def start 
    puts "\n"
    puts "------------------------------------------------"
    puts "Here are the top 8 fuel-efficient cars of 2019."
    puts "------------------------------------------------"
    puts "\n"
    BestCars::Scraper.scrape_cars
    select_car
  end
  
  def list_cars
    BestCars::Car.all.each.with_index(1) do |car, index|
      puts "#{index}. #{car.model}"
    end
  end
  
  def select_car
    list_cars
    puts "\n"
    puts "Choose the number car you want more information about."
    puts "\n"
    print "> "
    
    input = gets.strip
    index = input.to_i - 1
    
    until index.between?(0, 8)
      puts "Invalid choice. Choose a number between 1 and 9."
      input = gets.strip
      index = input.to_i - 1
    end
    
    selected_car =  BestCars::Car.all[index]
    puts "\n"
    puts "______________________________________"
    puts "#{selected_car.model} information:"
    puts "______________________________________"
    puts "MPG: #{selected_car.mpg}"
    puts "EPA class: #{selected_car.epa_class}"
    puts "The fuel type is: #{selected_car.fuel_type}"
    puts "\n"
      
    get_more_info(selected_car.url)
    
  end
  
  def get_more_info(selected_car_url)
    puts "Would you like to know about the range and annual fuel cost of this car?"
    print "> "
    input = gets.strip.upcase
    until [ "Y", "YES", "N", "NO"].include?(input)
      puts "Please enter Y or N."
      input = gets.strip.upcase
    end
    BestCars::Scraper.scrape_range_cost(selected_car_url) if input == "Y" || input == "YES"
    exit_or_restart
  end
  
  def exit_or_restart
    puts "Would you like to choose another car?"
    print "> "
    input = gets.strip.upcase
    until [ "Y", "YES", "N", "NO"].include?(input)
      puts "Please enter Y or N."
      input = gets.strip.upcase
    end
    if input == "Y" || input == "YES"
      select_car
    else
      puts "\n"
      puts "Thank you! Program ended."
    end
      
  end
  
  
end  