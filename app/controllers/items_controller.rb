class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  def edit
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    redirect_to action: :index unless current_user.id == @item.user_id
    if @item.destroy
      redirect_to action: :index
      # else
      #   @item.destroy失敗時の処理（エラーメッセージを表示させるなど）
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :image, :explanation, :burden_id, :product_condition_id, :category_id,
      :area_id, :number_of_month_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
