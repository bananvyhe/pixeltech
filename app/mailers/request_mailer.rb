class RequestMailer < ApplicationMailer
	def send_low_mail(mes) 
		mail(to:"loadonden@yahoo.com",from:"admin@pixeltech.ru",subject:mes)
	end
end
