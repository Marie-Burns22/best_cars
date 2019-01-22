class BestCars::CLI 
  
  def start 
    puts "Here are the top 10 fuel-efficient cars."
    BestCars::Scraper.scrape_cars
    puts "Choose the number car you want more information about."
    list_cars
    
    get_input
  end
  
  def list_cars
    BestCars::Car.all.each.with_index(1) do |car, index|
      puts "#{index}. #{car.model}"
    end
  end
  
  def get_input
    input = gets.strip
    index = input.to_i - 1
    if index.between?(0, 9)
      selected_car =  BestCars::Car.all[index]
      puts "The mpg is #{selected_car.mpg}."
     # puts the other attributes from the page.
      #  ask user if they would like to know about the range and fuel cost or look up another car.
      # if yes, call second scraper method passing the car url. If no, ask for car number and call get_input.
    else
      puts "Invalid choice. Choose a number between 1 and 10."
      get_input
    end
  end
end  