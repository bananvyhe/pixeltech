class VoodoosController < ApplicationController
  before_action :set_voodoo, only: [:show, :edit, :update, :destroy]

  # GET /voodoos
  # GET /voodoos.json
  def index
    @voodoos = Voodoo.all
  end

  # GET /voodoos/1
  # GET /voodoos/1.json
  def show
  end

  # GET /voodoos/new
  def new
    @voodoo = Voodoo.new
  end

  # GET /voodoos/1/edit
  def edit
  end

  # POST /voodoos
  # POST /voodoos.json
  def create
    @voodoo = Voodoo.new(voodoo_params)

    respond_to do |format|
      if @voodoo.save
        format.html { redirect_to @voodoo, notice: 'Voodoo was successfully created.' }
        format.json { render :show, status: :created, location: @voodoo }
      else
        format.html { render :new }
        format.json { render json: @voodoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voodoos/1
  # PATCH/PUT /voodoos/1.json
  def update
    respond_to do |format|
      if @voodoo.update(voodoo_params)
        format.html { redirect_to @voodoo, notice: 'Voodoo was successfully updated.' }
        format.json { render :show, status: :ok, location: @voodoo }
      else
        format.html { render :edit }
        format.json { render json: @voodoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voodoos/1
  # DELETE /voodoos/1.json
  def destroy
    @voodoo.destroy
    respond_to do |format|
      format.html { redirect_to voodoos_url, notice: 'Voodoo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voodoo
      @voodoo = Voodoo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voodoo_params
      params.fetch(:voodoo, {})
    end
end
