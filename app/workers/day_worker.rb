class DayWorker
	include Sidekiq::Worker

	def perform
		client = Client.all
		client.find_each do |c| 

		 	if c.ballance < $step*24*7 && c.ballance > $step*24*5
 					userid = c.user_id
 					loadon = "bananvyhe@gmail.com"
	 				user = User.find(userid.to_i)
	 				uma = user.email
					LowMailer.send_low_mail(uma).deliver!		 
			end
		end 
					
	 
	 
	end
end