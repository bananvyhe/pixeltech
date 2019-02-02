class CashWorker < ApplicationController
	include Sidekiq::Worker
	def perform
		client = Client.all
		client.find_each do |c|
			c.ballance -= $stepcash 
		 	c.save
		end
	end
end