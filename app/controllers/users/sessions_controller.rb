class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_path
  end
  def guest_check
    if current_user == User.find(1)
      redirect_to root_path, notice: "このページを見るには会員登録が必要です。"
    end
  end
end