class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access_request!
  def index
		@items = Item.where(user_id: payload['user_id']).joins(:item_attribute) 

 		# @items = Item.all
 		puts '@'*30
 		puts @items.inspect
 		puts '@'*30

  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find_by_user_id(payload['user_id'])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def item_params
  #   params.require(:item).permit(:)
  # end
end