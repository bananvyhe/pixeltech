class DayWorker < ApplicationController
	include Sidekiq::Worker

	def perform
		client = Client.all
		client.find_each do |c| 
			if c.ballance <  $stepcash*24*7
				userid = c.user_id
 				user = User.find(userid.to_i)
 				uma = user.email
 				# если не стоит метки об отправленном уже сообщении и она не снята с поступлением платежа
 				if c.mescount = nil
					LowMailer.send_low_mail(uma).deliver!	
					c.mescount = 1
					c.save
				end
			end
		end 
					
	 
	 
	end
end