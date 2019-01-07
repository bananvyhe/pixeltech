class CashWorker
	include Sidekiq::Worker

	def perform
		# Client.find_each {|c| CashService.fetch(c.id)}
	end
end