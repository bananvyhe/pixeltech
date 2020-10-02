class Client < ApplicationRecord
	belongs_to :user
	has_one :inboxe, :dependent => :delete
	#после добавления клиента, запускается задача, формируется, переходит в redis, переходит в sidekiq и выполняется
	# после добавления в базу (commit), если сделать _create - задача может попасть в sidekiq до того как запись появится в базе данных и сайдкик выплюнет исключение, что такой записи не найдено
	#after_commit :fetch_cash_data, on: [:create]

	private
	# метод, который будет заниматься формированием задачи
	def fetch_cash_data
		CashService.delay.fetch(id)
	end
end
