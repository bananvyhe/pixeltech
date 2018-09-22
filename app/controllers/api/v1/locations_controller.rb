class Api::V1::LocationsController < ApplicationController
  before_action :set_location

  def show
    # render json: @location, include: ['recordings']
  end

  private

    def set_location
      @location = Location.find(params[:id])
    end
end