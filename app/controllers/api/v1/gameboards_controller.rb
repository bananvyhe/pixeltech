class Api::V1::GameboardsController < ApiController
  before_action :set_gameboard, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access_request!
  # before_action :set_gameboard
  # GET /gameboards
  # GET /gameboards.json
  def index
    # @gameboards = Gameboard.find_by_user_id(payload['user_id'])
    # render json: @gameboards, :except => [:created_at, :updated_at]
  end

  # GET /gameboards/1
  # GET /gameboards/1.json
  def show
  end

  # GET /gameboards/new
  def new
    # @gameboard = Gameboard.new
  end

  # GET /gameboards/1/edit
  def edit
  end

  # POST /gameboards
  # POST /gameboards.json
  def kill 
    pksend =params[:killid]
    @killeduser = Gameboard.find_by_user_id(pksend)
    @killeduser.pk = true
    @killeduser.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_gameboard
    #   @gameboard = Gameboard.find_by_user_id(payload['user_id'])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameboard_params
      params.require(:gameboard).permit(:expirience, :karma, :cry, :pk, :plus, :minus, :message, :killid )
    end
end
