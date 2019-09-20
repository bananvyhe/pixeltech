class LandingPageController < ApplicationController
	def index
		@vks = Vk.where('raiting > 10.00').order(created_at: :desc, medias_row: :desc,  raiting: :desc, v_like: :desc).limit(10).offset(@pos)
		@posts = Post.all.order(created_at: :desc).where(clan_name: 'user')

		if (current_user)
			@currole = current_user.role
			@postsprivate = Post.all.order(created_at: :desc).where(clan_name: current_user.role)
	    path = case current_user.role
	    	when 'superadmin'
	        users_path
	      when 'admin'
	        users_path
	      when 'user'
	        posts_path
	      when 'voodoo'
	        # voodoo_index_path
	        posts_path
	      when 'client'
	        siteowners_path
	      else
	      
	      	# If you want to raise an exception or have a default root for users without roles
	    end
	    if current_user.role != "user" &&  current_user.role != "voodoo"
	    	redirect_to path  
	    end 
	  else
	    
	  end
  end
end
