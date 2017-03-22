require 'active_support/all'
require 'net/http'
require 'uri'
require 'json'

uri                        = URI.parse("https://dadata.ru/api/v2/clean/address")
request                    = Net::HTTP::Post.new(uri)
request.content_type       = "application/json"
request["Authorization"]   = "Token a8230dda9070aa73d398ceefea25c99c623ff94a "
request["X-Secret"]        = "76d610d1c465f31dbf170ac4f0b6a42ff73d956b "

data  = []
https = {
  use_ssl: uri.scheme == "https",
}

file = File.new("data.txt")
file.each do |line|
  request.body = JSON.dump([line])
  Net::HTTP.start(uri.hostname, uri.port, https) do |http|
    data << http.request(request)
  end
end

my_hash = {}

File.open('output.txt', 'w') do |file|
  data.each do |data|
    file.write JSON.parse(data.body)
    my_hash[file] = JSON.parse(data.body)
  end
end


File.open('output2.txt', 'w') do |file|
  file.write my_hash.each { |d| d.to_xml(:root => 'FIA') }
end
