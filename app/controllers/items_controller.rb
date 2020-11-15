class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :image, :explanation, :burden_id, :product_condition_id, :category_id,
      :area_id, :number_of_month_id, :price
    ).merge(user_id: current_user.id)
  end
end
