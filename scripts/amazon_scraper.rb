require 'open-uri'
require 'nokogiri'
require 'csv'

url = "http://www.amazon.com/s/ref=sr_pg_3?rh=i%3Aaps%2Ck%3Ayugioh+trading+cards&page=1"
page = Nokogiri::HTML(open(url))


#url = "http://www.amazon.com/s/ref=sr_pg_3?rh=i%3Aaps%2Ck%3Ayugioh+trading+cards&page=1#{i+1}"
#page = Nokogiri::HTML(open(url))

  
  name = []
page.css('h2.a-size-medium').each do |line|
  name << line.text.strip
end
 
price = []
page.css('span.a-size-base.a-color-price.s-price.a-text-bold').each do |line|
  price << line.text
end

  
 # Write data to CSV file

    CSV.open("amazon_listings.csv", "w") do |file|

      file << ["Listing Name", "Price"]
      name.length.times do |i|
        file << [name[i], price[i]]
      end
    end       