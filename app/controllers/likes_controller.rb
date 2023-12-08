class LikesController < ApplicationController
  before_action :set_tweet

  def create
    like = current_user.likes.build(article_id: params[:article_id])
    like.save
    respond_to do |format|
      format.js
    end 
  end

  def destroy
    like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_tweet
    @article = Article.find(params[:article_id])
  end
end
