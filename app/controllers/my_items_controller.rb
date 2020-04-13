class MyItemsController < ApplicationController
  before_action :authorize_access_request!
	before_action :set_my_item, only: [:show, :edit, :update, :destroy, :move]

  def index
		@items = MyItem.where(user_id: payload['user_id']).joins(:item_attribute).sorted
  end

  def move
    @item.update(my_item_params)
  end   

  def use_item
    # puts 'test '*20
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

end