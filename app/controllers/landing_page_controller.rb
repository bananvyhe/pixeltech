class LandingPageController < ApplicationController
	def index
		if (current_user)
	    path = case current_user.role
	    	when 'superadmin'
	        users_path
	      when 'admin'
	        users_path
	      when 'user'
	        users_path
	      when 'voodoo'
	         voodoo_index_path
	      when 'client'
	        siteowners_path
	      else
	      
	      	# If you want to raise an exception or have a default root for users without roles
	    end

	    redirect_to path   
	  else
	    
	  end
  end
end
