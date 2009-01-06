require 'net/http'

#http://www.dapper.net/RunDapp?dappName=Craigslist_XML_Minneapolis&v=1&v_item_name=guitar
@base_url = 'http://www.dapper.net/RunDapp?dappName=Craigslist_XML_Minneapolis&v=1'
@item_name = ARGV[0]
puts "this is a network item query: " + @item_name
@base_url = @base_url + "&v_item_name=" + @item_name
puts "this is the full URL: " + @base_url

puts "this is the content from the full URL: "



netHTTPobject = Net::HTTP.start(@base_url, 80 )
responseObject = netHTTPobject.get('/')
print responseObject.body





