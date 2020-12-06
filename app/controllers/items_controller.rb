class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :order]

  def index
    @items = Item.order('id DESC')
    @p = Item.ransack(params[:q])
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
    @messages = Message.all
    @message = Message.new
  end

  def edit
    redirect_to action: :index if current_user.id != @item.user_id || @item.purchaser_history.present?
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def search
    @p = Item.ransack(params[:q])
    @items = @p.result(distinct: true)
  end

  def destroy
    redirect_to action: :index unless current_user.id == @item.user_id
    if @item.destroy
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :explanation, :burden_id, :product_condition_id, :category_id,
      :area_id, :number_of_month_id, :price, images: []
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
