class DayWorker
	include Sidekiq::Worker

	def perform
		client = Client.all
		 client.find_each do |c| 
		 	c.ballance += $step.to_i
		 	c.save
		 end
	end
end