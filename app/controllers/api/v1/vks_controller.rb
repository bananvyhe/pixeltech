class Api::V1::VksController < ApiController
 # require 'pry'
	skip_before_action :authenticate_user!
  before_action :set_vks
  before_action :set_user
  before_action :authorize_access_request!, only: [:associate]
	def index
    @vks = Vk.where('raiting > 10.00').order(created_at: :desc, medias_row: :desc,  raiting: :desc, v_like: :desc).limit(10).offset(@pos)
    # @app = current_user.vk_ids
    # Pry.start(binding)
    # render json: @vks, :include => :appointments, :except => [:created_at, :updated_at]

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
  def associate
    # params.require(:vk).permit( :wallStr )
    user_id = params[:user_id]
    @wallid = Vk.find(params[:wallStr])
    # Pry.start(binding)
    @userget = User.find(params[:user_id])

    # @findvk = Appointment.find_by_vk_id(params[:wallStr])
    # @finduser = Appointment.find_by_user_id(params[:user_id])
    # unless (@findvk && @finduser)
    unless (Appointment.where(vk_id: @wallid, user_id: user_id).exists?)
      @wallid.users << @userget
      @wallid.save
    end
  end

  def create
		params.require(:_json).each do |d|
    wall = d[:wall]
    like = d[:v_like]
    views = d[:v_views]
    posted_at = d[:posted_at]
    medias_row = d[:medias_row]
    thumb_map_img_as_div = d[:thumb_map_img_as_div]
    title = d[:title]
    TobdWorker.perform_async(wall, like, views, posted_at, thumb_map_img_as_div, title, medias_row)
	end

  end 
  private

  def set_user
    # @appointment = Appointment.find_by_user_id(13)
  end

  def vk_params
    params.require(:vk).permit(:wall, :medias_row, :raiting, :title, :posted_at, :v_views, :v_like, :thumb_map_img_as_div)
  end

  def set_vks
    # @user = User.find_by(username: params[:username])
    if (params[:pos])
      @pos = params[:pos]
    end
  end 
end