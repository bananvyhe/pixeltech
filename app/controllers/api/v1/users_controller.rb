class Api::V1::UsersController < Api2Controller
  # before_action :set_users
    skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, raise: false
  before_action :set_users, only: [:index, :show, :edit, :update, :destroy]
	
  def index
    render json: @user
  end

  def lobbyall
    
    @users = User.where(role: 'user').all.order(created_at: :desc) 
     puts @users.inspect
    print '++++++++++++++||>'
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