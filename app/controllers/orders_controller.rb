class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :buy_already, only: [:index]
  before_action :buy_self, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:deli_num , :area_id , :ward , :block , :room , :phone).merge(token: params[:token] , user_id: current_user.id , item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
       card: order_params[:token],
      currency: 'jpy'
    )
  end

  def buy_already
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end

  def buy_self
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

end
