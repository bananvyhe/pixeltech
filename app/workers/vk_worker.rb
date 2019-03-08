class VkWorker < ApplicationController
	require 'mechanize'
	require 'json'
	require 'httparty'
	
	include Sidekiq::Worker
	 
	def perform	
		agent = Mechanize.new
		url="https://vk.com/po_jesti"
		page = agent.get(url)
		show_more = agent.page.link_with(text: 'Show more').click
		@rowsd = Array.new
		def selection_scrapped(row)
			title     = row.css('.pi_text').inner_text
			posted_at = row.css('.wi_date').inner_text
			v_views = row.css('.v_views').inner_text
			v_like = row.css('.v_like').inner_text
	 
			thumb_map_img_as_div = row.search('.thumb_map_img_as_div').map{ |n| n['style'][/url\((.+)\)/, 1] }
			data = {
		    title: title,
		    posted_at: posted_at,
		    v_views: v_views,
		    v_like: v_like,
		    thumb_map_img_as_div: thumb_map_img_as_div
		  }	
			@rowsd << data
		end
		page.css('.wall_item').each do |row|
			selection_scrapped(row)
		end
		show_more.css('.wall_item').each do |row|
			selection_scrapped(row)
		end
	end

 
	

end