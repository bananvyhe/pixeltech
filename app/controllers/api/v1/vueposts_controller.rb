class Api::V1::VuepostsController < ApiController
  before_action :set_vuepost, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access_request!
  # before_action :set_gameboard
  # GET /gameboards
  # GET /gameboards.json
  def index
		# @vks = Vk.where('raiting > 10.00').order(created_at: :desc, medias_row: :desc,  raiting: :desc, v_like: :desc).limit(10).offset(@pos)
		@posts = Post.all.order(created_at: :desc).where(clan_name: 'user')
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
 

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_gameboard
    #   @gameboard = Gameboard.find_by_user_id(payload['user_id'])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vuepost_params
      params.require(:vuepost).permit( :title, :body, :user_id, :clan_name )
    end
end
