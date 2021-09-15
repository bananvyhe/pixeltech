 class Api::V1::RequestController < Api2Controller

 	def message
 		email = params[:user][:email]
 		text = params[:user][:text]
 		RequestMailer.message_request_mail(text, email).deliver!	
 	end
 end 