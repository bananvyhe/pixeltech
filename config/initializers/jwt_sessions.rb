JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = Rails.application.credentials.secret_key_base 
#JWTSessions.refresh_exp_time = 604800 # 1 week in seconds
JWTSessions.access_exp_time = 300
JWTSessions.refresh_exp_time = 1209600