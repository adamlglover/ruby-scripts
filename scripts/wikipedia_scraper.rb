require 'open-uri'
require 'nokogiri'

url = "http://web.b.ebscohost.com/ehost/results?sid=08ac3fb4-96aa-4072-b25a-6c7150965299%40sessionmgr112&vid=1&hid=101&bquery=nielsen&bdata=JmRiPWJ0aCZ0eXBlPTAmc2l0ZT1laG9zdC1saXZl"
page = Nokogiri::HTML(open(url))

# for teams ... puts page.css('li.toclevel-3')

# for players ... puts page.css('td[style="text-align:left;"]').text

puts page.css('div.result-list-record').text
 
#style="font-size:15px;"