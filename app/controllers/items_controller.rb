class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :purchase_information, only: [:edit]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description_of_item, :item_category_id, :item_state_id,
                                 :shipping_charge_id, :prefecture_id, :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def purchase_information
    redirect_to root_path if current_user.id == @item.user_id || @item.buy != nil
  end
end
