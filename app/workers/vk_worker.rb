class VkWorker < ApplicationController
	wrap_parameters format: [:json, :xml]
	require 'mechanize'
	require 'json'
	require 'httparty'

	include Sidekiq::Worker
	def perform	
		def selection_scrapped(row)
			title     = row.css('.pi_text').inner_text.sub("Expand text…", "").sub("#", " ")
			posted_at = row.css('.wi_date').inner_text
			v_views = row.css('.v_views').inner_text.sub("K", "000")
			v_like = row.css('.v_like').inner_text
			thumb_map_img_as_div = row.search('.thumb_map_img')
			.map do |n| 
		 		if n['data-src_big'] != nil
		 			n['data-src_big'][0...-8]
		 		end
		 	end
			wall = row.css('div.wi_info a').map { |link| link['href'] }
			data = {
				wall: wall,
			    title: title,
			    posted_at: posted_at,
			    v_views: v_views,
			    v_like: v_like,
			    thumb_map_img_as_div: thumb_map_img_as_div
			  }	
				@rowsd << data
			end
		agent = Mechanize.new

# ,
# 			
# 			'https://vk.com/powermetalheads',
# 			'https://vk.com/mtblog',
# 			'https://vk.com/clevermusic',
# 			'https://vk.com/warm_music',
# 			'https://vk.com/soundtracks_for_coding',
# 			'https://vk.com/lostark',
# 			'https://vk.com/e_music_ambient',
# 			'https://vk.com/fashionsound','https://vk.com/joise', 
			# 'https://vk.com/lostark'

		url=['https://vk.com/po_jesti']
		@rowsd = Array.new
		timer = rand(1.0 .. 2.0)
		url.each do |url|
	 		page = agent.get(url)
			sleep(timer)
			show_more = agent.page.link_with(text: 'Show more').click
 			sleep(timer)
			show_more1 = show_more.link_with(text: 'Show more').click 
			sleep(timer)
			show_more2 = show_more1.link_with(text: 'Show more').click  
			sleep(timer)
			show_more3 = show_more2.link_with(text: 'Show more').click 
			sleep(timer)
			show_more4 = show_more3.link_with(text: 'Show more').click 
			sleep(timer)
			show_more5 = show_more4.link_with(text: 'Show more').click 
			sleep(timer)
			show_more6 = show_more5.link_with(text: 'Show more').click 
			sleep(timer)
			show_more7 = show_more6.link_with(text: 'Show more').click 
			sleep(timer)
			show_more8 = show_more7.link_with(text: 'Show more').click
			sleep(timer)
			
 			
			page.css('.wall_item').each do |row|
				selection_scrapped(row)
			end
			show_more.css('.wall_item').each do |row|
				selection_scrapped(row)
			end
			show_more1.css('.wall_item').each do |row|
				selection_scrapped(row)
			end
			show_more2.css('.wall_item').each do |row|
				selection_scrapped(row)
			end
			show_more3.css('.wall_item').each do |row|
				selection_scrapped(row)
			end
			show_more4.css('.wall_item').each do |row|
				selection_scrapped(row)
			end
			show_more5.css('.wall_item').each do |row|
				selection_scrapped(row)
			end 
			show_more6.css('.wall_item').each do |row|
				selection_scrapped(row)
			end 
			show_more7.css('.wall_item').each do |row|
				selection_scrapped(row)
			end 
			show_more8.css('.wall_item').each do |row|
				selection_scrapped(row)
			end 
		end
		headers = {
		  "Content-Type" => "application/json"  
		}
		if Rails.env.production?
			HTTParty.post("https://pixeltech.ru/api/v1/vk",headers: headers, body: @rowsd.to_json)
		end
		if Rails.env.development?
			HTTParty.post("http://localhost:3000/api/v1/vk",headers: headers, body: @rowsd.to_json)
		end
	end
end