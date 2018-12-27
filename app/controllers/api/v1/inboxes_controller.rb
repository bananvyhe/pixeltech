class Api::V1::InboxesController < ApiController
  #before_action :set_inbox, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!
  
 
  # GET /inboxes
  # GET /inboxes.json
  def index
    @inboxes = Inbox.all
  end

  # GET /inboxes/1
  # GET /inboxes/1.json
  def show
  end

  # GET /inboxes/new
  def new
    @inbox = Inbox.new
  end

  # GET /inboxes/1/edit
  def edit
  end

  # POST /inboxes
  # POST /inboxes.json
  def create
    @secret_key = Rails.application.credentials.secret_secret
    @inbox = Inbox.new({:amount => params[:amount],:operation_id => params[:operation_id],:label => params[:label], :sha1_hash => params[:sha1_hash], :withdraw_amount => params[:withdraw_amount], :datetime => params[:datetime], :codepro => params[:codepro], :unaccepted => params[:unaccepted], :notification_type => params[:notification_type], :currency => params[:currency], :sender => params[:sender], :sender => params[:sender]})

    @check = Digest::SHA1.hexdigest("#{@inbox.notification_type}&#{@inbox.operation_id}&#{@inbox.amount}&#{@inbox.currency}&#{@inbox.datetime}&#{@inbox.sender}&#{@inbox.codepro}&#{@secret_key}&#{@inbox.label}")
    @inbox.check = @check
    
    if @check == @inbox.sha1_hash 
      @inbox.save
      @fee =  Client.find(params[:label])

      @fee.ballance += @inbox.withdraw_amount
    end 
    
    #@inbox = Inbox.new({:amount => params[:amount], :operation_id => params[:operation_id]})
    # respond_to do |format|
    #   if @inbox.save
    #     format.html { redirect_to @inbox, notice: 'Inbox was successfully created.' }
    #     format.json { render :show, status: :created, location: @inbox }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @inbox.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /inboxes/1
  # PATCH/PUT /inboxes/1.json
  # def update
  #   respond_to do |format|
  #     if @inbox.update(inbox_params)
  #       format.html { redirect_to @inbox, notice: 'Inbox was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @inbox }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @inbox.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /inboxes/1
  # DELETE /inboxes/1.json
  # def destroy
  #   @inbox.destroy
  #   respond_to do |format|
  #     format.html { redirect_to inboxes_url, notice: 'Inbox was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_inbox
    #   @inbox = Inbox.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def inbox_params
    
    #   params.require(:inbox).permit(:body, :amount, :operation_id, :unaccepted)
    # end
end
