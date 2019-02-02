class CashWorker
	include Sidekiq::Worker
	 $step=0.38
	def perform
		
		client = Client.all
		client.find_each do |c|
			
		 	c.ballance -= $step 
		 	c.save
		end
	end
end