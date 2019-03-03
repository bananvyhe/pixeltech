require 'open-uri'
require 'nokogiri'

url="https://vk.com/powermetalheads"

document = open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)

parsed_content.css('.pi_text').each do |row|
	title = row.inner_text
	puts title
	puts '--------------------------'
end