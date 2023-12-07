class LikesController < ApplicationController
  def create
    like = current_user.likes.build(article_id: params[:article_id])
    like.save
    redirect_to 
  end

  def destroy
    like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    like.destroy
    redirect_to 
  end
end
