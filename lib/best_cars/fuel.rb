class BestCars::Fuel
attr_accessor :car, :range, :cost
  
  @@all = []
  
  def initialize(fuel_hash)
    
  end
  
  def list_range_fuel
    puts "\n"
    puts "Total range: #{doc.css("div.yui-content div#tab1 table tr td.sbsCellData div.rangeGraphic div.phevRange").text.delete(" miles Total Range")}#{doc.css("div.yui-content div#tab1 table tr td.sbsCellData div.rangeGraphic div.totalRange").text.delete(" miles Total Range")} miles"
    puts "\n"
    puts "Annual fuel cost for both electricity and gasoline: #{doc.css("div.yui-content div#tab1 table tr td.sbsEconData")[0].text.delete("Electricity + Gasoline: ")}"
    puts "\n"
  end
  
end
  