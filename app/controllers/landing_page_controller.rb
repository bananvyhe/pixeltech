class LandingPageController < ApplicationController
	def index
		if (current_user)
	    path = case current_user.role
	      when 'siteowner'
	        lists_path
	      when 'voodoo'
	         some_other_path
	      else
	      	# If you want to raise an exception or have a default root for users without roles
	    end

	    redirect_to path   
	  else
	    
	  end
  end
end
