class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
  def guest_check
    if current_user == User.find(1)
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
  end
end
