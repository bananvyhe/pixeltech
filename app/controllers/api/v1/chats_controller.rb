 class Api::V1::ChatsController < ApiController
 	before_action :authorize_access_request!
 	def index
 		@chats = Chat.all
 		 render json: @chats 
 	end
 	def create
 		# puts params[:text]
 		# puts params[:clan_name]
 		clname = Clan.find_by_clan(params[:clan_name])
 		@mes = Chat.new
 		@mes.text = params[:text]
 		@mes.user_id = payload['user_id']
 		@mes.clan_id = clname.id
 		print '========='
 		puts @mes.inspect
 		print '========='
 		if @mes.save
    	response.set_header('clname', clname)
    	Pusher.trigger('messages', 'new', {
	      text: @mes.text,
	      clname: clname,
	      
	    })
    end
 		# puts clname.id
 	end
 end 