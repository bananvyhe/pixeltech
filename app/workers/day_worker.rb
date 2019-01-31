class DayWorker
	include Sidekiq::Worker

	def perform
		 
				 #  @siteowner = Siteowner.new
					# @siteowner.spent = $step*24 
				 
					# @siteowner.save
	 
	end
end