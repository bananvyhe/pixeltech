class VkWorker < ApplicationController
	wrap_parameters format: [:json, :xml]
	require 'mechanize'
	require 'json'
	require 'httparty'

	include Sidekiq::Worker
	def perform	
		def selection_scrapped(row)
			title     = row.css('.pi_text').inner_text
			posted_at = row.css('.wi_date').inner_text
			v_views = row.css('.v_views').inner_text
			v_like = row.css('.v_like').inner_text
			thumb_map_img_as_div = row.search('.thumb_map_img_as_div').map{ |n| n['style'][/url\((.+)\)/, 1] }
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
		url=["https://vk.com/po_jesti",
			"https://vk.com/mtblog",
			'https://vk.com/clevermusic',
			'https://vk.com/warm_music',
			'https://vk.com/soundtracks_for_coding',
			'https://vk.com/powermetalheads',
			'https://vk.com/lostark',
			'https://vk.com/e_music_ambient',
			'https://vk.com/fashionsound',
			'https://vk.com/joise']
		@rowsd = Array.new

		url.each do |url|
			page = agent.get(url)
			show_more = agent.page.link_with(text: 'Show more').click
			sleep (1)
			show_more = show_more.link_with(text: 'Show more').click
			sleep (1)
			show_more = show_more.link_with(text: 'Show more').click
			sleep (1)
			show_more = show_more.link_with(text: 'Show more').click
			sleep (1)
			show_more = show_more.link_with(text: 'Show more').click
			show_more.to_s.delete "Expand text…"
 
			page.css('.wall_item').each do |row|
				selection_scrapped(row)
			end
			show_more.css('.wall_item').each do |row|
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