class DayWorker
	include Sidekiq::Worker

	def perform
		  
				 client = Client.all
		client.find_each do |c| 

		 	if c.ballance < 1000
 					userid = c.user_id
 					loadon = "bananvyhe@gmail.com"
	 				user = User.find(8)
	 				uma = user.email
					LowMailer.send_low_mail(uma).deliver!
				 
				 
			end
		end 
					
	 
	 
	end
end