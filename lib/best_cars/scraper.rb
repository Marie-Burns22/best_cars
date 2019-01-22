require 'open-uri'
require 'nokogiri'
require 'pry'

class BestCars::Scraper
  
  #add 2 scraper methods
  def self.scrape_cars
    cars = []
    doc = Nokogiri::HTML(open("https://www.fueleconomy.gov/feg/best-worst.shtml"))
    
    car_array = doc.css('table#bestcars').css('tbody')
    
    car_array.each do |car_row|
    car = {
      model:  car_row.css('div.desc a').text
      epa_class: car_row.css('th.vclass').text
      mpg: car_row.css('td.auto-mpg').text
      fuel_type: car_row.css('button').children.text
      url:
    }
    
    
    binding.pry
    end
    
  # 1 first level to get car name, type of engine, gas mileage
  # collect array of hashes. each hash is a car.  the hash will be used to create instances of the car class
  end
  
  def scrape_car_info(car_URL)
  # 1 second level to get range and emissions and other data
  # called based on user input. takes an argument of the car URL.
  end
  
  
  
end