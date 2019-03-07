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
# .link_with(text: 'Show more').click
# .link_with(text: 'Show more').click
# .link_with(text: 'Show more').click
# .link_with(text: 'Show more').click
 # print show_more.body 
def selection_scrapped(row)
	title     = row.css('.pi_text').inner_text
	posted_at = row.css('.wi_date').inner_text
	v_views = row.css('.v_views').inner_text
	v_like = row.css('.v_like').inner_text
	## регулярные выражения здесь не работают, необходщим синтаксис нокогири - реализован экстракт ссылок с картинками из стилей
 	# (/https.*jpg/)
	thumb_map_img_as_div = row.search('.thumb_map_img_as_div').map{ |n| n['style'][/url\((.+)\)/, 1] }

	puts thumb_map_img_as_div
	puts title
	puts posted_at
	puts v_like	
	puts v_views

	puts '--------------------------'
end

page.css('.wall_item').each do |row|
	selection_scrapped(row)
end

show_more.css('.wall_item').each do |row|
	selection_scrapped(row)
end




