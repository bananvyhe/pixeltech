class CashWorker
	include Sidekiq::Worker

	def perform
		
		client = Client.all
		client.find_each do |c| 
		 	c.ballance -= $step
		 	c.save
		end
	end
end