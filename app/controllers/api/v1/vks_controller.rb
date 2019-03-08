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
		@vk = Vk.new({:title => params[:title],:posted_at => params[:posted_at],:v_views => params[:v_views], :v_like => params[:v_like], :thumb_map_img_as_div => params[:thumb_map_img_as_div]})
    @vk.save
  end 
 
end
