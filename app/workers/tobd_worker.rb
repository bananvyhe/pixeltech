class TobdWorker < ApplicationController
  include Sidekiq::Worker
 
  def perform (url, wall, like, views, posted_at, thumb_map_img_as_div, title, medias_row)
 		raiting = like.to_f/views.to_f*1000	
    url=url.strip.chomp
    # groupsvk = Groupsvk.find_or_create_by(namegroup: url)
  	@vk = Vk.new({:url => url, :title => title,:medias_row => medias_row,:posted_at => posted_at,:v_views => views, :v_like => like, :thumb_map_img_as_div => thumb_map_img_as_div, :wall => wall})
 
    df = Vk.find_by(wall: wall.to_s)
    @vk.groupsvk = Groupsvk.find_or_create_by(namegroup: url) 

  	if (df == nil)
  		@vk.save
    else
      # df.update_attribute(:groupsvk, groupsvk)
      df.update_attribute(:url, url)
    	df.update_attribute(:title, title)
    	df.update_attribute(:thumb_map_img_as_div, thumb_map_img_as_div)
    	df.update_attribute(:medias_row, medias_row)
			df.update_attribute(:raiting, raiting.round(2))
			df.update_attribute(:v_views, views)
			df.update_attribute(:v_like, like)
			df.update_attribute(:posted_at, posted_at)
		end
	end
end