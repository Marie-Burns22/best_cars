class BestCars::CLI 
  
  def start 
    puts "Here are the top 10 fuel-efficient cars."
    BestCars::Scraper.scrape_cars
    
    list_cars
    
    get_input
  end
  
  def list_cars
    BestCars::Car.all.each.with_index(1) do |car, index|
      puts "#{index}. #{car.model}"
    end
  end
  
  def get_input
    puts "Choose the number car you want more information about."
    input = gets.strip
    if input.to_i.between?(1, 10)
      #either puts all the attributes or use url to call second scrape method
    else
      puts "Invalid choice. Choose a number between 1 and 10."
      get_input
    end
  end
end  