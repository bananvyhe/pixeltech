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
    #расчет снятия 4% с уровня при смерти
    @explvling = [68, 295, 805, 1716, 3154, 5249, 8136, 11955, 16851, 22973, 30475, 39516, 50261, 62876, 77537, 94421, 113712, 135596, 160266, 84495, 95074, 107905, 123472, 142427, 165669, 194509, 231086, 279822, 374430, 209536, 248781, 296428, 354546, 425860]
    pksend =params[:killid]
    @killeduser = Gameboard.find_by_user_id(pksend)
    @killeduser.pk = true
    @expuser = @killeduser.expirience
    @lvlcounter = 0
    @expcounter = 0

    @explvling.each do |pos|
      if pos+@expcounter < @expuser
        @lvlcounter+= 1
        @expcounter+=pos
      end
      if pos+@expcounter > @expuser
        @nowexp = @explvling[@lvlcounter]
       
        @nowexp = @nowexp.to_i   
            puts @nowexp  
        @minusedexp = @nowexp / 100 * 4
        puts @minusedexp
        @killeduser.expirience -= @minusedexp 
        @killeduser.save
        break
      end
    end

   
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
