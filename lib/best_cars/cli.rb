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
    
    number = gets.strip
    index = number.to_i - 1
    
    until index.between?(0, 8)
      puts "Invalid choice. Choose a number between 1 and 9."
      number = gets.strip
      index = number.to_i - 1
    end
    
    selected_car = BestCars::Car.all[index]
    BestCars::Car.list_car_info(index)
    get_more_info(selected_car)
  
  end
  
  # tried to refactor with this method, but program seemed to get stuck
  # def get_input
  #   print "> "
  #   input = gets.strip.upcase
  #   until [ "Y", "YES", "N", "NO"].include?(input)
  #     puts "Please enter Y or N."
  #     input = gets.strip.upcase
  #   end
  # end
  
  def get_more_info(selected_car)
    puts "Would you like to know about the range and annual fuel cost of this car?"
    # get_input
    print "> "
    input = gets.strip.upcase
    until [ "Y", "YES", "N", "NO"].include?(input)
      puts "Please enter Y or N."
      input = gets.strip.upcase
    end
    BestCars::Scraper.scrape_range_cost(selected_car) if input == "Y" || input == "YES"
    exit_or_restart
  end
  
  def exit_or_restart
    puts "Would you like to choose another car?"
    # get_input
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