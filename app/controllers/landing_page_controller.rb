class LandingPageController < ApplicationController
	def index
		if (current_user)
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
