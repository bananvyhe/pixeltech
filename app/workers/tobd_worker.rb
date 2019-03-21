class TobdWorker
  include Sidekiq::Worker

  def perform (like, views, posted_at)
  	raiting = like.to_f/views.to_f*1000

	  	 		df.update_attribute(:raiting, raiting.round(2))
	  			df.update_attribute(:v_views, views)
	  			df.update_attribute(:v_like, like)
	  			df.update_attribute(:posted_at, posted_at)
 

	  			# if df[:created_at] > Date.today - 7.days
	  			# 	# df.update_attribute(:raiting, -20)
	  			# end

			end
  	
  end
end