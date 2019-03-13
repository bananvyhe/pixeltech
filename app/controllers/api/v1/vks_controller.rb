class Api::V1::VksController < ApiController
 
	skip_before_action :authenticate_user!

	def index
    @vks = Vk.all.order(raiting: :desc)
  end
 
  def show
  end
 
  def new
    @vk = Vk.new
  end
 
  def edit
  end

  # POST /Vks
  # POST /Vks.json
  def create
		params.require(:_json).each do |d|
			@vk = Vk.new({:title => d[:title],:posted_at => d[:posted_at],:v_views => d[:v_views], :v_like => d[:v_like], :thumb_map_img_as_div => d[:thumb_map_img_as_div],:wall => d[:wall]})
  	 	like = d[:v_like]
  	 	views = d[:v_views]
 			# raiting = like.to_f/views.to_f
  	 	wald = d[:wall]
  	 	if df = Vk.find_by(:wall => wald.to_s)
  	 		# df.update_attribute(:raiting, raiting.round(1))
  			df.update_attribute(:v_views, views)
  			df.update_attribute(:v_like, like)
			end
  		if !Vk.find_by(:wall => wald.to_s)
  			@vk.save	
		  end
  	end
  end 
end
