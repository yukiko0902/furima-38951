class ItemsController < ApplicationController
  # before_action :set_item, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description_of_item, :item_category_id, :item_state_id,
                                 :shipping_charge_id, :prefecture_id, :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end
end
