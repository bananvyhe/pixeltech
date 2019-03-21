class TobdWorker
  include Sidekiq::Worker

  def perform (like, views, posted_at, wald, medias_row, thumb_map_img_as_div)
  	raiting = like.to_f/views.to_f*1000
	    if df = Vk.find_by(:wall => wald.to_s)
	    		df.update_attribute(:thumb_map_img_as_div, thumb_map_img_as_div)
	  	 		df.update_attribute(:raiting, raiting.round(2))
	  			df.update_attribute(:v_views, views)
	  			df.update_attribute(:v_like, like)
	  			df.update_attribute(:posted_at, posted_at)
	  			if medias_row != nil
						df.update_attribute(:medias_row, medias_row)
					else
						df.update_attribute(:posted_at, nil)
					end

	  			# if df[:created_at] > Date.today - 7.days
	  			# 	# df.update_attribute(:raiting, -20)
	  			# end

			end
  	
  end
end