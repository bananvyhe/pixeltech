# require 'open-uri'
# require 'nokogiri'
require 'mechanize'
require 'json'
require 'httparty'
# require 'Pry'

agent = Mechanize.new
# agent.user_agent_alias = 'Mac Safari'

url='https://vk.com/mmorpg.russia'

page = agent.get(url)
# print page.body 
# puts page.inspect
# print page.body
# puts "#{page.links}"

# document = open(url)
# content = document.read
# parsed_content = Nokogiri::HTML(content)

# show_more = agent.page.link_with(text: 'Show more').click
show_more = agent.page 
print show_more.body
	# timer = rand(1.0 .. 5.0)
 # 			sleep(timer)
	# 		show_more1 = show_more.link_with(text: 'Show more').click 
	# 		sleep(timer)
	# 		show_more2 = show_more1.link_with(text: 'Show more').click 
	# 		sleep(timer)
	# 		show_more3 = show_more2.link_with(text: 'Show more').click 
	# 		sleep(timer)
	# 		show_more4 = show_more3.link_with(text: 'Show more').click 
	# 		sleep(timer)
	# 		show_more5 = show_more4.link_with(text: 'Show more').click
	# 		sleep(timer)
	# 		show_more6 = show_more5.link_with(text: 'Show more').click
	# 		sleep(timer)
	# 		show_more7 = show_more6.link_with(text: 'Show more').click 
 
puts  '--------------------'

@rowsd = Array.new
def selection_scrapped(row)
	title     = row.css('.pi_text').inner_text
	posted_at = row.css('.wi_date').inner_text
	v_views = row.css('.v_views').inner_text
	v_like = row.css('.v_like').inner_text
	## регулярные выражения здесь не работают, необходщим синтаксис нокогири - реализован экстракт ссылок с картинками из стилей
 	# (/https.*jpg/
 	thumb_map_img_as_div = row.search('.thumb_map_img')
 		.map do  |n| 
	 		if n['data-src_big'] != nil
	 		n['data-src_big'][0...-8]
	 		end
	 	end
	# thumb_map_img_as_div = row.search('.thumb_map_img_as_div').map{ |n| n['style'][/url\((.+)\)/, 1] }
  
	 puts thumb_map_img_as_div
	# puts title
	# puts posted_at
	# puts v_like	
	# puts v_views
	data = {
    title: title,
    posted_at: posted_at,
    v_views: v_views,
    v_like: v_like,
    thumb_map_img_as_div: thumb_map_img_as_div
  }	

  @rowsd << data
	# Pry.start(binding)

	# puts '--------------------------'
end

page.css('.wall_item').each do |row|
	selection_scrapped(row)
end

show_more.css('.wall_item').each do |row|
	selection_scrapped(row)
end
# show_more1.css('.wall_item').each do |row|
# 	selection_scrapped(row)
# end
# show_more2.css('.wall_item').each do |row|
# 	selection_scrapped(row)
# end
# show_more3.css('.wall_item').each do |row|
# 	selection_scrapped(row)
# end
# show_more4.css('.wall_item').each do |row|
# 	selection_scrapped(row)
# end
# show_more5.css('.wall_item').each do |row|
# 	selection_scrapped(row)
# end 
# show_more6.css('.wall_item').each do |row|
# 	selection_scrapped(row)
# end 
# show_more7.css('.wall_item').each do |row|
# 	selection_scrapped(row)
# end 
 # HTTParty.post(app.root_url + "/api/v1/vk", body: JSON.pretty_generate(@rowsd.to_json) 



