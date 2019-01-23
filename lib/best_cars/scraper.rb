require 'open-uri'
require 'nokogiri'
require 'pry'

class BestCars::Scraper
  
  def self.scrape_cars
    cars = []
    doc = Nokogiri::HTML(open("https://www.fueleconomy.gov/feg/best-worst.shtml"))
    
    car_array = doc.css('table#bestcars').css('tbody')
    
    car_array.each do |car_row|
      car_attributes = {
        model: car_row.css('div.desc a').text,
        epa_class: car_row.css('th.vclass').text,
        mpg: car_row.css('td.auto-mpg').text,
        fuel_type: car_row.css('button').children.text,
        url: "https://www.fueleconomy.gov" + car_row.css('div.desc a')[0].attributes['href'].value  #the volvo does not have a type since it is a gas car. need to add code to return "gasoline"
      }
  
         #the 2 BMW cars are returning on the same line.
  
      car = BestCars::Car.new(car_attributes)
      binding.pry
      end
  end
  
  def self.scrape_range_cost(selected_car_url)
    doc = Nokogiri::HTML(open)
    puts "#{selected_car_url}"
  # 1 second level to get range and emissions and other data
  # called based on user input. takes an argument of the car URL.
  end
  
end