class MyItemsController < ApplicationController
  before_action :authorize_access_request!
	before_action :set_my_item, only: [:show, :edit, :update, :destroy, :move]


 
  def index
		@items = MyItem.sorted
 
  end
  # def update
  #   respond_to do |format|
  #     if @item.update(my_item_params)
  #       if @item.update_attributes(my_item_params)
  #         format.html { redirect_to action: :index, notice: 'item was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @item }
  #       else
  #         format.html { render :crop, notice: 'item was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @item }
  #       end
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end  
  def move
    # puts '10'*20

    @item.update(my_item_params)

  end   
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_my_item
        # binding.pry
    @item = MyItem.find_by_user_id(payload['user_id'])
  end
  def my_item_params
    params.require(:my_item).permit(:position, :qty, :user_id, :item_attribute_id, :description)
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  # def item_params
  #   params.require(:item).permit(:)
  # end
end