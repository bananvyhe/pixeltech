class Api::V1::RefreshController < ApiController
   before_action :authorize_refresh_request!
   skip_before_action :authenticate_user!, raise: false
  def create
 
    
    tokens = JWTSessions::Session.new(payload: access_payload , refresh_payload:  refresh_payload  )
    render json: tokens.login

  end
  def access_payload

    # payload here stands for refresh token payload
     user = User.find_by!(id: payload['user_id'])
    allroles = user.roles 
    @roles =[]
    allroles.each do |i|
      @roles << i.name
    end
    { user_id: user.id, role: @roles[0], username: user.username}
  end
  def refresh_payload
    # payload here stands for refresh token payload
     user = payload['user_id']
    { user_id: user}
  end
      def current_user
    @current_user ||= User.find(payload['user_id'])
  end


  
 end