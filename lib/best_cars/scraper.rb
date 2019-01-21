require 'open-uri'
require 'nokogiri'
require 'pry'

class BestCars::Scraper
  
  #add 2 scraper methods
  def self.scrape_cars
    cars = []
    doc = Nokogiri::HTML(open("https://www.fueleconomy.gov/feg/best-worst.shtml"))
    binding.pry
    doc.css('tbody')
    
    # car name doc.css('tbody').first.css('div.desc a').text 
    # epa class doc.css('tbody').first.css('th.vclass').text
    # mpg doc.css('tbody').first.css('td.auto-mpg').text
  # 1 first level to get car name, type of engine, gas mileage
  # collect array of hashes. each hash is a car.  the hash will be used to create instances of the car class
  end
  
  def scrape_car_info(car_URL)
  # 1 second level to get range and emissions and other data
  # called based on user input. takes an argument of the car URL.
  end
  
  
  
end