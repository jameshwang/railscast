require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://penny-arcade.com/comic'))

# doc.css('td.title a').each do |title|
# 	puts title.text
# end

comic_url = doc.css('div.comic img')

puts comic_url.first["src"]