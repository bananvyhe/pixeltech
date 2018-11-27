class Api::V1::RefreshController < ApiController
   before_action :authorize_refresh_request!
   skip_before_action :authenticate_user!
  def create
    session = JWTSessions::Session.new(payload: access_payload)
    render json: session.refresh(found_token)
  end
  def access_payload
    # payload here stands for refresh token payload
     user = User.find_by!(id: payload['user_id'])
    { user_id: user.id, role: user.role, username: user.username }
  end
  def current_user
   
    @current_user ||= User.find(payload['user_id'])
   
  end
  
 end