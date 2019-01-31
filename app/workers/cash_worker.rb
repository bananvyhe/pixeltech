class CashWorker
	include Sidekiq::Worker

	def perform
		client = Client.all
		 client.find_each do |c| 
		 	c.ballance -= (0.1).to_i
		 	c.save
		 end
	end
end