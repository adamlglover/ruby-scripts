require 'open-uri'
require 'nokogiri'
require 'csv'

url = "http://www.zillow.com/homes/for_rent/Shaw-Washington-DC/house,condo,apartment,duplex,townhouse_type/121785_rid/0-815317_price/0-3000_mp/days_sort/38.926114,-77.009976,38.904743,-77.040875_rect/14_zm/"
page = Nokogiri::HTML(open(url))


website = []
page.css('.routable.mask.hdp-link').each do |line|
  website << line['href']
end

# Write data to CSV file
    CSV.open("zillow2_listings.csv", "w") do |file|
      file << ["URL"]
      website.length.times do |i|
        file << [website[i]]
      end
    end
