class Api::V1::UsersController < ApiController
  before_action :set_users
	def index
    # render json: @location, include: ['recordings']
  end

  def show
    # render json: @location, include: ['recordings']
  end

  private

    def set_users
      @user = User.find(params[:username])
    end
 
end