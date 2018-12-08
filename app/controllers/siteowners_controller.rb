class SiteownersController < ApplicationController
  before_action :set_siteowner, only: [:show, :edit, :update, :destroy]
  #Пополнение счета
  
  def replenishment
    @amount = 10
  end

  def payment_process
    @params[:amount] = {:type => :integer, :in => 1..10000.0}
    return if !sanitize_params

    @amount = params[:amount]
    # Инициализация модуля Яндекс Деньги
    ym = YM.new
    err = "Ошибка работы с модулем оплаты "
    if !ym.successful
      err << ym.error if Rails.env.development?
      flash[:error] = err
      redirect_to replenishment_path
      return
    end
    # Прием платежа на кошелек Яндекс Денег
    res = ym.recieve_payment(@amount, "#{current_user.id}: #{current_user.email}")
    if !ym.successful
      err << ym.error if Rails.env.development?
      flash[:error] = err
      redirect_to replenishment_path
      return
    end
    # Требуется внешняя аутентификация пользователя
    if res.status != "ext_auth_required"
      err = "Нет запроса на внешнюю авторизацию"
      err << "status: #{res.status} error: #{res.error}" if Rails.env.development?
      flash[:error] = err
      redirect_to replenishment_path
      return
    end
    # Сохраняем проверочный код платежа в сессии
    session[:ym_secure_code] = ym.secure_code
    session[:ym_amount] = @amount

    # Отсылаем методом POST acs_params:
    @acs_params = res.acs_params
    @acs_uri = res.acs_uri
    render :payment_process
  end

  def payment_fail
    msg = 'Платеж не прошел.'
    
    reason = case params[:reason]
    when 'no3ds' then 'Указан неверный код CVV.'
    when 'not-enough-funds' then 'Недостаточно средств.'
    else
      e = Exception.new 'Платеж не прошел.'
      ExceptionNotifier.notify_exception(e,
        :env => request.env, 
        :data => {:message => "Ошибка при совершении оплаты: #{params[:reason]}"})
      params[:reason]
    end
    flash[:error] = msg << ' ' << reason

    redirect_to replenishment_path
  end

  def payment_success
#Эти 2 строки измените под свои нужды:
    @params[:secure_code] = {:type => :integer, :in => 10000000..99999999}
    return if !sanitize_params

    secure_code = params[:secure_code]

    if !session[:ym_secure_code] || !session[:ym_amount]
      flash[:error] = "Платеж не прошел. Ошибка сессии"
      redirect_to replenishment_path
      return
    end

    amount = session[:ym_amount].to_i
    if session[:ym_secure_code].to_i != secure_code
      flash[:error] = "Не верный проверочный код платежа. Платеж не прошел"
    else
      current_user.with_lock do
        @inc = Incoming.create(:user_id => current_user.id, :amount => amount)
        current_user.amount += amount
        current_user.amount = eval(sprintf("%8.2f",current_user.amount))
        current_user.save(validate: false)
      end
      notify  "Баланс пополнен",
          "Баланс пополнен на сумму #{amount} #{rub}. Текущий баланс: #{current_user.amount} #{rub}"
      UserMailer.new_incoming(@inc.id).deliver if current_user.notify_incomings
      flash[:success] = "Платеж прошел"
    end
    redirect_to replenishment_path
  ensure
    session[:ym_secure_code] = nil
    session[:amount] = nil
  end
 


  # GET /siteowners
  # GET /siteowners.json
  def index
    # instance_id = YandexMoney::ExternalPayment.get_instance_id(CLIENT_ID)
    @siteowners = Siteowner.all
  end

  # GET /siteowners/1
  # GET /siteowners/1.json
  def show
  end

  # GET /siteowners/new
  def new
    @siteowner = Siteowner.new
  end

  # GET /siteowners/1/edit
  def edit
  end

  # POST /siteowners
  # POST /siteowners.json
  def create
    @siteowner = Siteowner.new(siteowner_params)

    respond_to do |format|
      if @siteowner.save
        format.html { redirect_to @siteowner, notice: 'Siteowner was successfully created.' }
        format.json { render :show, status: :created, location: @siteowner }
      else
        format.html { render :new }
        format.json { render json: @siteowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /siteowners/1
  # PATCH/PUT /siteowners/1.json
  def update
    respond_to do |format|
      if @siteowner.update(siteowner_params)
        format.html { redirect_to @siteowner, notice: 'Siteowner was successfully updated.' }
        format.json { render :show, status: :ok, location: @siteowner }
      else
        format.html { render :edit }
        format.json { render json: @siteowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siteowners/1
  # DELETE /siteowners/1.json
  def destroy
    @siteowner.destroy
    respond_to do |format|
      format.html { redirect_to siteowners_url, notice: 'Siteowner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_siteowner
      @siteowner = Siteowner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def siteowner_params
      params.fetch(:siteowner, {})
    end
end
