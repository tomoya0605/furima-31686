class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.purchaser_history.present?
      redirect_to root_path
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new(order_params)
    if  @order.valid?
        set_card
        @order.save
        redirect_to root_path
    else
        render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:zip_code, :city, :street_number, :telephone_number, :building_number, :area_id, :purchaser_history_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:card_token])
  end
  
  def set_order
    @item = Item.find(params[:item_id])
  end

  def set_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end