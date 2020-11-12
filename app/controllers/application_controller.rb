class ApplicationController < ActionController::Base
  # before_action :basic_auth
<<<<<<< Updated upstream
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday]
    )
  end

  def basic_auth
=======
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    # カラムの保存を可能とする記述
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
    end 
    
    def basic_auth
>>>>>>> Stashed changes
    # 'admin'というユーザー名と、'password'というパスワードでBasic認証できるように設定
    authenticate_or_request_with_http_basic do |username, password|
      username == 'tomoya' && password == 'tomomari0605'
    end
  end
end