class Api::V1::GameboardsController < ApiController
  before_action :set_gameboard, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access_request!

  # before_action :set_gameboard
  # GET /gameboards
  # GET /gameboards.json
  def index
    print '---00--->'
    # @gameboards = Gameboard.where(pk: false) 
    @gameboards = User.where(role: 'user').joins(:gameboard)
    # puts gameboards.inspect
    print '---00--->'
         # print '---00--->'
         # puts vote.inspect
         # print '---00--->'    
    # render json:  gameboards, :except => [:created_at, :updated_at]
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
  def ressurect
    res = User.joins(:gameboard).find(payload['user_id']) 

    res.gameboard.pk = false
    # puts res.gameboard.inspect
    res.gameboard.save 
  end
  def getPkStatus
    @pkstat = User.joins(:gameboard).find(payload['user_id'])
    nowtime = Time.now.to_i
    response.set_header('nowtime', nowtime)
  end
  def calculateminus id 
    userminall = User.find(id ).votes.where(vote: false).to_a
 
    @allusersmin = []
    userminall.each do |i|
      pickupuser = User.find(i.user_id).username
      @allusersmin << pickupuser
    end
     @allusersmin
  end
  def calculateplus id 
    userplus = User.find(id).votes.where(vote: true).to_a

    @allusers = []
    userplus.each do |i|
      pickupuser = User.find(i.user_id).username
      @allusers << pickupuser
    end
    @allusers
    # userplus = Gameboard.find_by_user_id(id)
    # userplusall = userplus.votes.where(gameboard_id: userplus.id).where(vote: true).to_a
 
    # @allusers = []
    # userplusall.each do |i|
    #   pickupuser = User.find(i.user_id).username
    #   @allusers << pickupuser
    # end
    #  @allusers
  end
  def getkarma id 
    userkarma = Gameboard.find_by_user_id(id)
    userkarma = userkarma.karma.to_i
  end

  def userinfo
    userplus = calculateplus params[:user_id] 
    usermin = calculateminus params[:user_id] 
    # userplus = calculateplus params[:user_id] 
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
      # @usermin = Gameboard.find_by_user_id(minvote)
      @userfind = User.find(payload['user_id'])
      @usermin = User.find(minvote)
      def relminus
        relations = @usermin.votes.find_by_user_id(payload['user_id'])
        relations.vote = false
        relations.save
      end
      if @usermin.votes.find_by_user_id(payload['user_id'])
        relminus
      end      
      unless @usermin.votes.find_by_user_id(payload['user_id'])
        vote = @usermin.votes.create(:vote => false, :user_id => payload['user_id'])
        # @usermin.users << @userfind
        # relminus
      end 
    end
    # захват плюсов в карму:
    if params[:plus]
      plusvote = params[:plus]

      # @userplus = Gameboard.find_by_user_id(plusvote)
      # юзер оценивающий пользователя т.е. вы
      @userfind = User.find(payload['user_id'])
      # оцениваемый юзер
      @userplus = User.find(plusvote)

      plusi = calculateplus @userplus.id
      
        if plusi.count == 2 &&  @userplus.role == 'user' 
          @make_clan_item =  ItemAttribute.find_or_create_by(item_name: 'Права лидера', description: 'Позволяет создать клан', image: '../images/clanbuild.jpg') 
          clname = Clan.find_by(clan: "superadmin")
          @adname = User.find_by(role: "superadmin")
          # puts 'sssssssssssss'
          # puts clname.inspect
          # puts 'sssssssssssss'   
          @mes = Chat.new     
          @mes.text = "У вас появились сторонники. Добавлен итем для получения прав на создание/управление кланом."
          @mes.user_id = @userplus.id
          @mes.clan_id = clname.id
          if @mes.save!
          # @mes.user_id = 0
              Pusher.trigger('system', @userplus.id.to_s, {
              id: @userplus.id,
              text: @mes.text,
              clan: clname.clan,
              username: "system"
            })
              # puts @mes
          end
        end
      

      def relplus
        relations = @userplus.votes.find_by_user_id(payload['user_id'])
        relations.vote = true
        relations.save
        # if relations.save
 
        # end
      end
      if @userplus.votes.find_by_user_id(payload['user_id'])
        relplus
      end
      # print '------->'
      # puts relations.inspect
      unless @userplus.votes.find_by_user_id(payload['user_id'])
        vote = @userplus.votes.create(:vote => true, :user_id => payload['user_id'])
 
         # print '---00--->'
         # puts vote.inspect
         # print '---00--->'
        # @userplus.votes << vote
         
         # @userplus.votes << @userfind 

          # @userplus.votes.vote = true
          # @userplus.save
        
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
        @killeduser.starts_at_time_of_pk = Time.now + 3.hours
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
