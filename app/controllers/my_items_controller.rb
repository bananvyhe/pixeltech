class MyItemsController < ApplicationController
  before_action :authorize_access_request!
	before_action :set_my_item, only: [:show, :edit, :update, :destroy, :move]

  def index
		@items = MyItem.where(user_id: payload['user_id']).joins(:item_attribute).sorted
  end
  def show
        puts 'test '*20
    puts params[:name]
    puts 'test '*20 
 
    @clan = Clan.find_by( clan: params[:name])
    puts @clan
    render json: @clan
  end
  
  def move
    @item.update(my_item_params)
  end   

  def use_item
    # puts 'test '*20
    puts params[:name]
    puts params[:id]
  end

  def check_clan
     
    @clan = Clan.find_by( clan: params[:name])
  end
  def paste_clan
    current_user.add_role params[:name].to_sym    

    # puts 'test '*20
    #   puts current_user.has_role? :voodoo
    # puts 'test '*20      


  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_my_item
    # binding.pry
    # @item = MyItem.find_by_user_id(payload['user_id'])
  end
  def my_item_params
    params.require(:my_item).permit( :name, :position, :qty, :user_id, :item_attribute_id, :description)
  end

end