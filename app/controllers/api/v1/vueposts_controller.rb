class Api::V1::VuepostsController < ApiController
  before_action :authorize_access_request!
  # before_action :set_vuepost, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_access_request!
  # before_action :set_gameboard
  # GET /gameboards
  # GET /gameboards.json
  def index
  	# print '==========>'
		# @vks = Vk.where('raiting > 10.00').order(created_at: :desc, medias_row: :desc,  raiting: :desc, v_like: :desc).limit(10).offset(@pos)
		@posts = Post.all.order(created_at: :desc).where(clan_name: 'voodoo').includes(:user)
      #   print '------->'
      # puts @posts.inspect
  end

  # GET /gameboards/1
  # GET /gameboards/1.json
  def show
  	# print '==========+++>'
  	@post = Post.includes(:user).includes(:comments).find(params[:id])
  	# puts @post.inspect
  end

  def showcomments

    # print '==========||||||>'
    @postComm = Post.includes(:user).find(params[:id]).comments
 
    # render json: @postComm
    # puts @postComm.inspect
    # print '===============||>'

  end

  # GET /gameboards/new
  def new
    # @gameboard = Gameboard.new
  end

  # GET /gameboards/1/edit
  def edit
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

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_gameboard
    #   @gameboard = Gameboard.find_by_user_id(payload['user_id'])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vuepost_params
      params.require(:vuepost).permit( :title, :body, :user_id, :clan_name, :username )
    end
end
