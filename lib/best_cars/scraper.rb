class BestCars::Scraper
  
  def self.scrape_cars
    cars = []
    doc = Nokogiri::HTML(open("https://www.fueleconomy.gov/feg/best-worst.shtml"))
    
    car_array = doc.css('table#bestcars').css('tbody')
    
    car_array.each do |car_row|
      
      fuel = nil
      
      if car_row.css('button').children.text == ""
        fuel = "Gasoline"
      else
        fuel = car_row.css('button').children.text
      end
      
      car_attributes = {
        model: car_row.css('div.desc a')[0].text.strip,
        epa_class: car_row.css('th.vclass').text,
        mpg: car_row.css('td.auto-mpg').text,
        fuel_type: fuel,
        url: "https://www.fueleconomy.gov" + car_row.css('div.desc a')[0].attributes['href'].value  #the volvo does not have a type since it is a gas car. need to add code to return "gasoline"
      }
  
      car = BestCars::Car.new(car_attributes)
    end
  end
  
  def self.scrape_range_cost(selected_car)
    doc = Nokogiri::HTML(open(selected_car.url))
    
    fuel_attributes = {
      car: selected_car,
      range: doc.css("div.yui-content div#tab1 table tr td.sbsCellData div.rangeGraphic div.phevRange").text.delete(" miles Total Range"),
      cost: doc.css("div.yui-content div#tab1 table tr td.sbsCellData div.rangeGraphic div.totalRange").text.delete(" miles Total Range")
    }
    
    fuel_object = BestCars::Fuel.new(fuel_attributes)
    selected_car.fuel_economy = fuel_object
    # binding.pry
    
  end
    
end