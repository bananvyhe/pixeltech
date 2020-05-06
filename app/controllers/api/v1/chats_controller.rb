 class Api::V1::ChatsController < ApiController
 	before_action :authorize_access_request!
 	def index
 		clan = params['clan']
 		# print '|||+++++++|||||||'
 		# puts clan
 		# @chats = Clan.where(clan: clan).joins(:chats) 
 		# chid =  params['checkid']
 		 		# print '|||+++++++|||||||'
 		# puts clan

 		if (params[:user_id])
 			usid = params[:user_id]
 			# @chats = Chat.includes(:clan).where(:clans => {:clan => clan}).includes(:user).where(:users => {:id => usid} )
 			@chats = Chat.includes(:role).where(:roles => {:name => clan}).includes(:user).where(:users => {:id => usid} )
 		else
 			@chats = Chat.includes(:role).where(:roles => {:name => clan})
 		end
 		# @chats = Chat.where( :user_id => payload['user_id']).includes(:clan).where(:clans => {:clan => clan}) 
 		# puts @chats.inspect
 		# print '|||===============|||||||'
 		# render json: @chats 
 	end
 	def create
 		# puts params[:text]
 		puts params[:clan_name]
 		# clname = Clan.find_by_clan(params[:clan_name])
 		clname = Role.find_by_name(params[:clan_name])
 		@mes = Chat.new
 		@mes.text = params[:text]
 		@mes.user_id = payload['user_id']
 		# @mes.clan_id = clname.id
 		@mes.add_role = clname.to_sym
 		# print '========='
 		# puts @mes.inspect
 		# print '========='
 		if @mes.save
    	response.set_header('clname', clname)
    	Pusher.trigger('messages', clname.clan, {
    		id: @mes.id,
	      text: @mes.text,
	      clan: clname.clan,
	      username: @mes.user.username
	    })
    end
 		# puts clname.id
 	end
 end 