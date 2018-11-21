class Api::V1::UsersController < Api2Controller
  before_action :set_users
  
	def index
    render json: @user
  end

  def show
    # render json: @location, include: ['recordings']
  end

  private

    def set_users
      # @user = User.find_by(username: params[:username])
      if (params[:email])
       @user = User.find_by( email: params[:email])
      elsif (params[:username])
        @user = User.find_by( username: params[:username])
      end
    end
 
end