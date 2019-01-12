class CashWorker
	include Sidekiq::Worker

	def perform
		 Client.find_each do |c| 
		 	c.ballance -= 1.to_i
		 	c.save
		 end
	end
end