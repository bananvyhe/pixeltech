class TobdWorker < ApplicationController
  include Sidekiq::Worker
 
  def perform (wall, like, views, posted_at, thumb_map_img_as_div, title, medias_row)
 		raiting = like.to_f/views.to_f*1000	
  	@vk = Vk.new({:title => title,:medias_row => medias_row,:posted_at => posted_at,:v_views => views, :v_like => like, :thumb_map_img_as_div => thumb_map_img_as_div, :wall => wall})
		df = Vk.find_by(wall: wall.to_s)

  	if (df == nil)
  		@vk.save
    else
    	df.update_attribute(:medias_row, medias_row)
			df.update_attribute(:raiting, raiting.round(2))
			df.update_attribute(:v_views, views)
			df.update_attribute(:v_like, like)
			df.update_attribute(:posted_at, posted_at)
		end
	end
end