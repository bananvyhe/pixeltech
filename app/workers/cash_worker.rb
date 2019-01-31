class CashWorker
	include Sidekiq::Worker

	def perform
		client = Client.all
		 client.find_each do |c| 
		 	c.ballance += 0.01
		 	c.save
		 end
	end
end