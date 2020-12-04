class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :search_product, only: [:index]

  # def index
  #   @items = item.all
  #   @results = @p.result.includes(:product)
  # end

  private

  # def search_product
  #   @p = Item.ransack(params[:q])
  #   @item_name = Item.select("name").distinct
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday]
    )
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'tomoya' && password == 'tomomari0605'
    end
  end
end
