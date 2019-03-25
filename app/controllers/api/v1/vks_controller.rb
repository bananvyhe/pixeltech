class Api::V1::VksController < ApiController
 # require 'pry'
	skip_before_action :authenticate_user!
  before_action :set_vks
	def index
    @vks = Vk.where('raiting > 10.00').order(created_at: :desc, medias_row: :desc,  raiting: :desc, v_like: :desc).limit(10).offset(@pos)
    render json: @vks
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
    wall = d[:wall]
    like = d[:v_like]
    views = d[:v_views]
    posted_at = d[:posted_at]
    medias_row = d[:medias_row]
    thumb_map_img_as_div = d[:thumb_map_img_as_div]
    title = d[:title]
    TobdWorker.perform_async(wall, like, views, posted_at, medias_row, thumb_map_img_as_div, title)
	end

  end 
  private

  def set_vks
    # @user = User.find_by(username: params[:username])
    if (params[:pos])
      @pos = params[:pos]
    end
  end 
end