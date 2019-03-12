class VksController < ApplicationController
  before_action :set_vk, only: [:show, :edit, :update, :destroy]

  # GET /vks
  # GET /vks.json
  def index
    @vks = Vk.all
  end

  # GET /vks/1
  # GET /vks/1.json
  def show
  end

  # GET /vks/new
  def new
    @vk = Vk.new
  end

  # GET /vks/1/edit
  def edit
  end

  # POST /vks
  # POST /vks.json
  def create
    @vk = Vk.new(vk_params)

    respond_to do |format|
      if @vk.save
        format.html { redirect_to @vk, notice: 'Vk was successfully created.' }
        format.json { render :show, status: :created, location: @vk }
      else
        format.html { render :new }
        format.json { render json: @vk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vks/1
  # PATCH/PUT /vks/1.json
  def update
    respond_to do |format|
      if @vk.update(vk_params)
        format.html { redirect_to @vk, notice: 'Vk was successfully updated.' }
        format.json { render :show, status: :ok, location: @vk }
      else
        format.html { render :edit }
        format.json { render json: @vk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vks/1
  # DELETE /vks/1.json
  def destroy
    @vk.destroy
    respond_to do |format|
      format.html { redirect_to vks_url, notice: 'Vk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vk
      @vk = Vk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vk_params
      params.require(:vk).permit(:wall, :raiting, :title, :posted_at, :v_views, :v_like, :thumb_map_img_as_div)
    end
end
