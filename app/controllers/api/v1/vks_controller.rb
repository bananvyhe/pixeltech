class Api::V1::VksController < ApiController
 # require 'pry'
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
			@vk = Vk.new({:title => d[:title],:medias_row => d[:medias_row],:posted_at => d[:posted_at],:v_views => d[:v_views], :v_like => d[:v_like], :thumb_map_img_as_div => d[:thumb_map_img_as_div],:wall => d[:wall]})
  	 	like = d[:v_like]
  	 	views = d[:v_views]
  	 	posted_at = d[:posted_at]
  	 	wald = d[:wall] 
      medias_row = d[:medias_row]
 
 			# binding.pry

  		if !Vk.find_by(:wall => wald.to_s)
  			@vk.save	
		  end
  	 	TobdWorker.perform_async(like, views, posted_at, wald, medias_row)
  	end
  end 
end
