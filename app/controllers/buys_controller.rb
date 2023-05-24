class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :purchase_information, only: [:index, :new]


  def index
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new
  end

  def new
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      @buy_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end

  end
  
  private
  
  def buy_params
    params.require(:buy_delivery).permit(:postcode, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def purchase_information
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.buy != nil
  
  end

end
