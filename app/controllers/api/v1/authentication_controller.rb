class Api::V1::AuthenticationController < ApiController
   
   skip_before_action :authenticate_user!
 



  def create
    user = User.find_by(email: params[:user][:email])
    if user
      if user.valid_password? params[:user][:password]
        # render json: { token: JsonWebToken.encode(sub: user.id, role: user.role, username: user.username ) ,
        #  refreshToken: JsonWebToken.refr(id: user.id) 
        # }
        payload = { user_id: user.id, role: user.role, username: user.username }
        refresh_payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_payload: refresh_payload)
        
         
         render json: session.login

        sign_in user
      else
         render json: { errors: "Неверный пароль." }
      end
    else
      render json: { errors: "Емайл не зарегистрирован." }
    end
  end
  

 end