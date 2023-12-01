class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :guest_check, only: [:update]

  def edit
    @articles = current_user.articles
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
  
  def set_user
    if params[:id] == 'guest_sign_in'
      @user = User.guest
    else
      @user = User.find(params[:id])
    end
  end

  def guest_check
    if @user == User.guest
      redirect_to root_path, notice: "Guest users cannot access this page."
    end
  end
end
