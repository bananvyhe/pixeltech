class LowMailer < ApplicationMailer
	def searchm
	 # user = User.find(8)
		#  user.email
		return "bananvyhe@gmail.com"
	end
	def send_low_mail(id) 
		
		  
		mail(to:'bananvyhe@gmail.com',from:"admin@pixeltech.ru",subject:id)
	end
end
