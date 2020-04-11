class MyItemsController < ApplicationController
	before_action :set_my_item, only: [:show, :edit, :update, :destroy, :move]
  before_action :authorize_access_request!

  def index
		@items = MyItem.where(user_id: payload['user_id']).joins(:item_attribute) 
 		# @items = Item.all
 		# puts '@'*30
 		# puts @items.inspect
 		# puts '@'*30
  end
  def update
    respond_to do |format|
      if @item.update(item_params)
        if @item.update_attributes(item_params)
          format.html { redirect_to action: :index, notice: 'item was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :crop, notice: 'item was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        end
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  def move
  	puts '10'*20
    @item.update(item_params)
  end  

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = MyItem.find_by_user_id(payload['user_id'])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def my_item_params
    params.require(:my_item).permit(:position, :qty, :user_id, :item_attribute_id, :user_id)
  end
end