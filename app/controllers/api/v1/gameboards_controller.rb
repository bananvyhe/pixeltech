class Api::V1::GameboardsController < ApiController
  before_action :set_gameboard, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize_access_request!

  # before_action :set_gameboard
  # GET /gameboards
  # GET /gameboards.json
  def index
    @gameboards = Gameboard.where(pk: false)
    render json:  @gameboards, :except => [:created_at, :updated_at]
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

  def calculateminus id 
    userminus = Gameboard.find_by_user_id(id)
    userminall = userminus.votes.where(gameboard_id: userminus.id).where(vote: false).to_a
 
    @allusersmin = []
    userminall.each do |i|
      pickupuser = User.find(i.user_id).username
      @allusersmin << pickupuser
    end
     @allusersmin
  end
  def calculateplus id 
    userplus = Gameboard.find_by_user_id(id)
    userplusall = userplus.votes.where(gameboard_id: userplus.id).where(vote: true).to_a
 
    @allusers = []
    userplusall.each do |i|
      pickupuser = User.find(i.user_id).username
      @allusers << pickupuser
    end
     @allusers
  end
  def getkarma id 
    userkarma = Gameboard.find_by_user_id(id)
    userkarma = userkarma.karma.to_i
  end

  def userinfo
    usermin = calculateminus params[:user_id] 
    userplus = calculateplus params[:user_id] 
    userkarma = getkarma params[:user_id]
    arraysizemin = usermin.size
    arraysizeplus = userplus.size
    response.set_header('usermin', usermin)
    response.set_header('arraysizemin', arraysizemin)
    response.set_header('userplus', userplus)
    response.set_header('arraysizeplus', arraysizeplus)
    response.set_header('userkarma', userkarma)
  end
  def vote
    # захват минусов в карму:
    if params[:minus]
      minvote = params[:minus]
      print "--------"
      puts minvote 
      @usermin = Gameboard.find_by_user_id(minvote)
      @userfind = User.find(payload['user_id'])
      def relminus
        relations = @usermin.votes.find_by_user_id(payload['user_id'])
        relations.vote = false
        relations.save
      end
      if @usermin.votes.find_by_user_id(payload['user_id'])
        relminus
      end      
      # print '------->'
      # puts relations.inspect
      unless @usermin.votes.find_by_user_id(payload['user_id'])
        @usermin.users << @userfind
        relminus
      end 
    end
    # захват плюсов в карму:
    if params[:plus]
      plusvote = params[:plus]
      @userplus = Gameboard.find_by_user_id(plusvote)
      @userfind = User.find(payload['user_id'])
      def relplus
        relations = @userplus.votes.find_by_user_id(payload['user_id'])
        relations.vote = true
        relations.save
      end
      if @userplus.votes.find_by_user_id(payload['user_id'])
        relplus
      end
      # print '------->'
      # puts relations.inspect
      unless @userplus.votes.find_by_user_id(payload['user_id'])
        @userplus.users << @userfind
        relplus
      end
    end
    # print "---------"
    # puts plusvote
  end

  # POST /gameboards
  # POST /gameboards.json
  def kill 
    #расчет снятия 4% с уровня при смерти
    @explvling = [68, 295, 805, 1716, 3154, 5249, 8136, 11955, 16851, 22973, 30475, 39516, 50261, 62876, 77537, 94421, 113712, 135596, 160266, 84495, 95074, 107905, 123472, 142427, 165669, 194509, 231086, 279822, 374430, 209536, 248781, 296428, 354546, 425860]
    pksend =params[:killid]
    @crysubtract =  Gameboard.find_by_user_id(payload['user_id'])
    puts @crysubtract.cry -= 100
    @crysubtract.save
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
            # puts @nowexp  
        @minusedexp = @nowexp / 100 * 4
        # puts @minusedexp
        @killeduser.expirience -= @minusedexp 

        @killeduser.save
        break
      end
    end

    @addkarmauser = Gameboard.find_by_user_id(payload['user_id'])
    puts @addkarmauser
    if @addkarmauser.karma == 0
      @addkarmauser.karma += 3000
    elsif @addkarmauser.karma > 10000
      @addkarmauser.karma += 10000
    else
      @addkarmauser.karma += 7000
    end
    @addkarmauser.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_gameboard
    #   @gameboard = Gameboard.find_by_user_id(payload['user_id'])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameboard_params
      params.require(:gameboard).permit(:expirience, :karma, :cry, :pk, :plus, :minus, :message, :killid, :user_id )
    end
end
