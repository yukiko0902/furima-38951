class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
   
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params 
    params.require(:item).permit(:image, :item_name, :description_of_item, :item_category_id, :item_state_id, :shipping_charge_id, :prefecture_id, :days_to_delivery_id, :price).merge(user_id:current_user.id)
  end
end
