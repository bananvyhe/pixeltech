class LandingPageController < ApplicationController
	def index
		@vks = Vk.where('raiting > 10.00').order(created_at: :desc, medias_row: :desc,  raiting: :desc, v_like: :desc).limit(10).offset(@pos)
		@posts = Post.all.order(created_at: :desc).where(clan_name: 'user')

		if (current_user)
			@roles = current_user.roles      
      @currole =[]
      @roles.each do |i|
        @currole << i.name
      end
     	# postrole = @currole.delete('user')
     	# postrole = @currole.delete('superadmin')
     	# postrole = @currole.delete('admin')
     	# postrole = @currole.delete('elder')
		 # binding.pry
			# @postsprivate = Post.all.order(created_at: :desc).where(clan_name: postrole)
			
			# path = case current_user.role

	    path = case true
	    	when @currole.include?('superadmin')
	        users_path
	      # when @currole.include?('admin')
	      #   users_path
	      # when @currole.include?('user','voodoo')
	        # posts_path
	      when @currole.include?('client')
	        siteowners_path
	      else
	      	
	      	# If you want to raise an exception or have a default root for users without roles
	    end
	    
	    # if current_user.roles != "user" &&  current_user.role != "voodoo"
	    # if @currole != ["user"] &&  @currole != ["voodoo"]
	    if path
	    	redirect_to path 
	    end
	    # end 
	  else
	    
	  end
  end
end
