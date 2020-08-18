class Api2Controller < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :authenticate_user!, raise: false
	before_action :set_default_format

  private
    def set_default_format
      request.format = :json
    end
end