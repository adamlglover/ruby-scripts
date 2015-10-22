require 'open-uri'
require 'nokogiri'
require 'csv'

url = "http://www.zillow.com/homes/for_rent/Shaw-Washington-DC/house,condo,apartment,duplex,townhouse_type/121785_rid/0-815317_price/0-3000_mp/days_sort/38.926114,-77.009976,38.904743,-77.040875_rect/14_zm/"
page = Nokogiri::HTML(open(url))


#page_numbers = []
 #page.css('ol.zsg-pagination').each do |line|
  #page_numbers << line.text
 #end  
   
#max_page = page_numbers.max.to_i
 
address = []

#max_page.times do |i|
  
 # url = "http://www.zillow.com/chicago-il/_p/#{i+1}"
  #page = Nokogiri::HTML(open(url))
  
  page.css('dt.property-address').each do |line|
    address << line.text.strip
end

website = []
page.css('.routable.mask.hdp-link').each do |line|
  website << line['href']
end

  # Write data to CSV file
    CSV.open("zillow_listings.csv", "w") do |file|
      file << ["Address", "URL"]
      address.length.times do |i|
        file << [address[i], website[i]]
      end
    end

