class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      card = Card.find_by(user_id: current_user.id) 
      customer = Payjp::Customer.retrieve(card.customer_token) 
      @card = customer.cards.first

    if current_user.id == @item.user_id || @item.purchaser_history.present?
      redirect_to root_path
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new(order_params)
    if  current_user.card.present?
        @order.valid?
        set_card
        @order.save
        redirect_to root_path
    else
      redirect_to new_card_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:zip_code, :city, :street_number, :telephone_number, :building_number, :area_id, :purchaser_history_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def set_order
    @item = Item.find(params[:item_id])
  end

  def set_card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price, 
      customer: customer_token,
      currency: 'jpy'
      )
  end
end
