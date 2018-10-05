class Api::V1::LocationsController < Api2Controller
  before_action :set_location
	def index
     render json: @location, include: ['recordings']
  end

  def show
   # render json: @location, include: ['recordings']
  end

  private

    def set_location
      @location = Location.find_by(name: params[:name]) 
    end

end