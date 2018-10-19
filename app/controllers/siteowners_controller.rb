class SiteownersController < ApplicationController
  before_action :set_siteowner, only: [:show, :edit, :update, :destroy]

  # GET /siteowners
  # GET /siteowners.json
  def index
    @siteowners = Siteowner.all
  end

  # GET /siteowners/1
  # GET /siteowners/1.json
  def show
  end

  # GET /siteowners/new
  def new
    @siteowner = Siteowner.new
  end

  # GET /siteowners/1/edit
  def edit
  end

  # POST /siteowners
  # POST /siteowners.json
  def create
    @siteowner = Siteowner.new(siteowner_params)

    respond_to do |format|
      if @siteowner.save
        format.html { redirect_to @siteowner, notice: 'Siteowner was successfully created.' }
        format.json { render :show, status: :created, location: @siteowner }
      else
        format.html { render :new }
        format.json { render json: @siteowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /siteowners/1
  # PATCH/PUT /siteowners/1.json
  def update
    respond_to do |format|
      if @siteowner.update(siteowner_params)
        format.html { redirect_to @siteowner, notice: 'Siteowner was successfully updated.' }
        format.json { render :show, status: :ok, location: @siteowner }
      else
        format.html { render :edit }
        format.json { render json: @siteowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siteowners/1
  # DELETE /siteowners/1.json
  def destroy
    @siteowner.destroy
    respond_to do |format|
      format.html { redirect_to siteowners_url, notice: 'Siteowner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_siteowner
      @siteowner = Siteowner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def siteowner_params
      params.fetch(:siteowner, {})
    end
end
