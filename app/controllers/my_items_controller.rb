class MyItemsController < ApplicationController
  before_action :authorize_access_request!
	before_action :set_my_item, only: [:show, :edit, :update, :destroy, :move]

  def index
		@items = MyItem.where(user_id: payload['user_id']).joins(:item_attribute).sorted
  end
  def show
        # puts 'test '*20
    # puts params[:name]
    # puts 'test '*20 
 
    @role = Role.find_by( name: params[:name])
    # puts @clan
    render json: @role
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
     
    @clan = Role.find_by( name: params[:name])
  end
  def paste_clan

    # current_user.add_role params[:name].to_sym
    #создаем права лидера
    leader = params[:name] + '_lead'
    elder = params[:name] + '_elder'
    # puts leader; puts elder;
    current_user.add_role leader.to_sym
    current_user.add_role elder.to_sym
    @make_res_item =  ItemAttribute.find_or_create_by(item_name: 'Воскрешение', description: 'Позволяет воскресить союзника', image: '../images/res.jpg') 
    @items = MyItem.new(item_attribute: @make_res_item, user: current_user, qty: 0)
    @make_ind_item =  ItemAttribute.find_or_create_by(item_name: 'Индульгенция', description: 'Позволяет смыть 100 кармы', image: '../images/carma.jpg') 
    @items1 = MyItem.new(item_attribute: @make_ind_item, user: current_user, qty: 50)
    @items.save!
    @items1.save!
    @make_clan_item =  ItemAttribute.find_by(item_name: 'Права лидера') 
    @items2 = MyItem.find_by(item_attribute: @make_clan_item, user: current_user).destroy


    current_user.add_role params[:name].to_sym 
    current_user.remove_role :applicant
      clname = Role.find_by(name: "superadmin")
      @mes = Chat.new     
      @mes.text = "Вы создали клан #{params[:name]}"
      @mes.user_id = current_user.id
      @mes.role_id = clname.id
      # @mes.add_role :superadmin
      if @mes.save!
      # @mes.user_id = 0
          Pusher.trigger('system', current_user.id.to_s, {
          id: current_user.id,
          text: @mes.text,
          clan: clname.name,
          username: "system"
        })
          # puts @mes
      end
    # allroles = current_user.roles 
    # @roles =[]
    # allroles.each do |i|
    #   @roles << i.name
    # end
 

    # binding.pry
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