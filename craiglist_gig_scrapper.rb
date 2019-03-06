# require 'open-uri'
# require 'nokogiri'
require 'mechanize'

agent = Mechanize.new

url="https://vk.com/powermetalheads"

page = agent.get(url)
# puts page.inspect
# print page.body
# puts "#{page.links}"

# document = open(url)
# content = document.read
# parsed_content = Nokogiri::HTML(content)
show_more = agent.page.link_with(text: 'Show more').click
.link_with(text: 'Show more').click
.link_with(text: 'Show more').click
.link_with(text: 'Show more').click
.link_with(text: 'Show more').click
 
 
page.css('.wall_item').each do |row|
	title     = row.css('.pi_text').inner_text
	posted_at = row.css('.wi_date').inner_text

	puts title
	puts posted_at
	puts '--------------------------'
end

show_more.css('.wall_item').each do |row|
	title     = row.css('.pi_text').inner_text
	posted_at = row.css('.wi_date').inner_text

	puts title
	puts posted_at
	puts '--------------------------'
end




