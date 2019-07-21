class GameboardsController < ApplicationController
  before_action :set_gameboard, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access_request!
  # before_action :set_gameboard
  # GET /gameboards
  # GET /gameboards.json
  def index
    @gameboards = Gameboard.find_by_user_id(payload['user_id'])
    render json: @gameboards, :except => [:created_at, :updated_at]
  end

  # GET /gameboards/1
  # GET /gameboards/1.json
  def show
  end

  # GET /gameboards/new
  def new
    @gameboard = Gameboard.new
  end

  # GET /gameboards/1/edit
  def edit
  end

  # POST /gameboards
  # POST /gameboards.json
  def create
    @xp =  Gameboard.find_by_user_id(payload['user_id'])
    @earn = params[:expirience]
    prng = Random.new
    randomcry = prng.rand(0..2)
    cry = prng.rand(1..3)

    if @xp == nil
      @gameboard = Gameboard.new
      @gameboard.user_id = payload['user_id']
      @gameboard.expirience = @earn
      @gameboard.save     
    else
      # if  randomcry == 1
        @xp.cry += cry
        crystal = cry.to_s
        #отправка кол-ва полученных кристаллов через заголовок
        response.set_header('cry', crystal)
      # end
      @xp.expirience += @earn
      @xp.save    
    end
   
    # @gameboard = Gameboard.new(gameboard_params)

    # respond_to do |format|
    #   if @gameboard.save
    #     format.html { redirect_to @gameboard, notice: 'Gameboard was successfully created.' }
    #     format.json { render :show, status: :created, location: @gameboard }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @gameboard.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /gameboards/1
  # PATCH/PUT /gameboards/1.json
  def update
    respond_to do |format|
      if @gameboard.update(gameboard_params)
        format.html { redirect_to @gameboard, notice: 'Gameboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @gameboard }
      else
        format.html { render :edit }
        format.json { render json: @gameboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gameboards/1
  # DELETE /gameboards/1.json
  def destroy
    @gameboard.destroy
    respond_to do |format|
      format.html { redirect_to gameboards_url, notice: 'Gameboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gameboard
      @gameboard = Gameboard.find_by_user_id(payload['user_id'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameboard_params
      params.require(:gameboard).permit(:expirience, :karma, :cry)
    end
end
