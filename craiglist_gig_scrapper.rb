require 'open-uri'
require 'nokogiri'

url="https://vk.com/powermetalheads"

document = open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)

parsed_content.css('.wall_item').each do |row|
	title     = row.css('.pi_text').inner_text
	posted_at = row.css('.wi_date').inner_text

	puts title
	puts posted_at
	puts '--------------------------'
end