class RequestMailer < ApplicationMailer
	def message_request_mail(mes, email) 
		@mes = mes
		@email = email
		mail(to:'loadonden@yahoo.com',from:"admin@pixeltech.ru",subject:email)
	end
end
