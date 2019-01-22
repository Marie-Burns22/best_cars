class BestCars::CLI 
  
  def start 
    puts "Here are the top 10 fuel-efficient cars."
    BestCars::Scraper.scrape_cars
  end
  
end  