class ApiController < ApplicationController
	before_action :verify_authenticity_token
	before_action :authenticate_user!, :only => [:new, :create], raise: false
	before_action :set_default_format

  private

    def set_default_format
      request.format = :json
    end
    
end