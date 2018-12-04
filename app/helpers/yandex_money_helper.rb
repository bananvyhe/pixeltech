require 'yandex_money/api'

module YandexMoneyHelper
  class YM
    # Класс служит для приема денег на Яндекс кошелек от других пользователей

    # Разработчик регистрирует свое приложение в Яндекс.Деньгах,
    # получает client_id - идентификатор приложения. 
    # В течение жизненного цикла приложения client_id не изменяется.
    CLIENT_ID = Rails.application.credentials.secret_client
    # Номер кошелька для приема нлатежей
    WALLET_ID = Rails.application.secrets.secret_yad

    attr_reader :successful
    attr_reader :error
    attr_reader :secure_code

    def initialize
      puts "=::YANDEX MONEY INITIALIZE::="
      puts "CLIENT_ID: #{CLIENT_ID}"
      puts "WALLET_ID: #{WALLET_ID}"

      #Получение идентификатора экземпляра приложения на основе client_id
      @instance_id = YandexMoney::ExternalPayment.get_instance_id(CLIENT_ID)
      if @instance_id.status == "success"
        @instance_id = @instance_id.instance_id
        @ext_pay = YandexMoney::ExternalPayment.new @instance_id
        @successful = true
      else
        @successful = false
        @error = @instance_id.error
      end

      puts "instance_id: #{@instance_id}"
      puts "ext_pay: #{@ext_pay}"
    end
    # Пополнение счета:
    def recieve_payment(amount, email)
      puts "reciving payment..."
      @successful = false
      @secure_code = rand 10000000..99999999
      puts "secure_code: #{@secure_code}"
      response = 	@ext_pay.request_external_payment({
        pattern_id: "p2p", #Фиксированное значение «p2p».
        to: WALLET_ID, #Номер счета для пополнения
        #amount: "1.00" Сумма к списанию с банковской карты (на счет поступит эта сумма минус комиссия).
        amount_due: amount, #Сумма к зачислению на счет (с карты будет списана эта сумма плюс комиссия).
        message: "Пополнение счета от #{email}" #Комментарий к зачислению, отображается получателю
      })
      puts "get request_id: #{response}"
      if response.status != "success"
        @error = response.error
        return
      end

      @request_id = response.request_id
      puts "request_id: #{@request_id}"
      puts "process_payment..."
      res = @ext_pay.process_external_payment({
        request_id: @request_id,
        ext_auth_success_uri: Rails.application.routes.url_helpers.payment_success_url(:secure_code => @secure_code),
        ext_auth_fail_uri: Rails.application.routes.url_helpers.payment_fail_url
      })
      @successful = true
      puts res
      res
    rescue => e
      @successful = false
      @error = e.message
      puts "error recieving payment #{e.message}"
      {:status => "error", :error => e.message}
    end
  end
end