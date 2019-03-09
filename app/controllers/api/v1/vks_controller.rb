class Api::V1::VksController < ApiController
	skip_before_action :authenticate_user!

	def index
    @vks = Vk.all
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
  		wall = Vk.find_by(wall: d[:wall])
  		if wall.present?
				@vk = Vk.new({:wall => d[:wall],:title => d[:title],:posted_at => d[:posted_at],:v_views => d[:v_views], :v_like => d[:v_like], :thumb_map_img_as_div => d[:thumb_map_img_as_div]})
		    @vk.save
	  	end
  	end
  end 

      
 
 
end
