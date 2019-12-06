class Api::V1::VuepostsController < ApiController
    before_action :authorize_access_request!

  before_action :set_post, only: [:show, :shocomm, :edit, :update, :destroy]
  # before_action :authorize_access_request!
  # before_action :authorize_access_request!
  # before_action :set_vuepost, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_access_request!
  # before_action :set_gameboard
  # GET /gameboards
  # GET /gameboards.json
  def index
  	# print '==========>'
		# @vks = Vk.where('raiting > 10.00').order(created_at: :desc, medias_row: :desc,  raiting: :desc, v_like: :desc).limit(10).offset(@pos)
		@posts = Post.all.order(created_at: :desc).where(clan_name: params[:clan_name]).includes(:user)
 
      # puts @posts.inspect
       # print '-------______------->'
  end

  def show
  	# print '||||||||||||>'
  	@post = Post.includes(:user).includes(:comments).find(params[:id])
  	voteweight = User.find(payload['user_id'])
    response.set_header('voteweight', voteweight.vote_weight)  
    # puts @post.inspect
    # print '||||||||||||>'
  end

  def shocomm
    print '000000000000>'
    # @postComm = Post.includes(:user).find(params[:id]).comments
    # @postComm = ['1','22','3','4','5']
    @postComm = Post.includes(:user).find(params[:id]).comments
    puts @postComm.inspect
    print '000000000000>'

  end

  # GET /gameboards/new
  def new
    # @gameboard = Gameboard.new
  end

  # GET /gameboards/1/edit
  def edit
  end
  def getrait
    postminall = Post.find(params[:id]).votes.where(vote: false).to_a
    @allpostmin = []
    @totalminus = 0
    postminall.each do |i|
      pickupuser = User.find(i.user_id).username
      pickupweight = User.find(i.user_id).vote_weight
      @allpostmin << [pickupuser, pickupweight]
      @totalminus += pickupweight
    end
    postplusall = Post.find(params[:id]).votes.where(vote: true).to_a
    @allpostplus = []
    @totalplus = 0
    postplusall.each do |i|
      pickupuser = User.find(i.user_id).username
      pickupweight = User.find(i.user_id).vote_weight
      @allpostmin << [pickupuser, pickupweight]
      @totalplus += pickupweight
    end  
    totalrait = 0-@totalminus+@totalplus
    response.set_header('postplus', @allpostplus)
    response.set_header('postmin', @allpostmin) 
    response.set_header('totalrait', totalrait)  
  end
  def votepost
    @userfind = User.find(payload['user_id'])
    @postfind = Post.find(params[:id])
    check = @postfind.votes.find_by_user_id(payload['user_id'])
    if params[:oldval] > params[:newval]      
      if check
        check.vote = false
        check.save
      end
      unless check
        vote = @postfind.votes.create(:vote => false, :user_id => payload['user_id'])
      end
    end
    if params[:oldval] < params[:newval]
      if check
        check.vote = true
        check.save
      end
      unless check
        vote = @postfind.votes.create(:vote => true, :user_id => payload['user_id'])
      end
    end    
    # print '||||||||||||>' 
    # puts params[:oldval]
    # print '||||||||||||>' 
    # puts params[:newval]
    # print '||||||||||||>'    
  end
  def create
    @post = Post.new(vuepost_params)
    @post.user = current_user
    posted = 123
    if @post.save
    	response.set_header('posted', posted)
    end
    # respond_to do |format|
    #   if @post.save
    #     # format.html { redirect_to @post, notice: 'Post was successfully created.' }
    #     # format.json { render :show, status: :created, location: @post }
    #   else
    #     # format.html { render :new }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end
    def destroy
    @post = Post.find(params[:id])
     @post.destroy
   end
  protected
 

  private
      def set_post
      @post = Post.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    # def set_gameboard
    #   @gameboard = Gameboard.find_by_user_id(payload['user_id'])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vuepost_params
      params.require(:vuepost).permit( :title, :body, :user_id, :clan_name, :username, :oldval, :newval )
    end
end
