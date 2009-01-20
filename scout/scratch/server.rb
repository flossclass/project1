require 'net/http'
require 'uri'
require 'rubygems'
require 'xmlsimple'
require 'pp'

#http://www.dapper.net/RunDapp?dappName=Craigslist_XML_Minneapolis&v=1&v_item_name=guitar
base_url = 'http://www.dapper.net/RunDapp'
item_name = ARGV[0]

puts "this is the item we are querying: " + item_name

#1: Simple POST. This will automatically construct the query string:
response_object = Net::HTTP.post_form(URI.parse(base_url),
                          {'dappName'=>'Craigslist_XML_Minneapolis', 'v'=>'1',
                            'v_item_name' => item_name
                          }
                          )

puts "Got HTTP status code " + response_object.code

#Check for HTTP status code above 200 and error if encountered:
#First, convert the code to a number/integer via the "to_i" method and compare to 200:
if response_object.code.to_i > 200
  puts "Got bad response after attempting to query the following URL: #{base_url}"
  exit 1
end

xml = response_object.body

doc = XmlSimple.xml_in xml
pp doc







