class LikesController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  def index
    @articles = Article.includes(:article_images).order("created_at DESC")
    likes = Like.where(user_id: current_user.id).pluck(:article_id)
    @like_list = Article.find(likes)
  end


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

  def set_article
    @article = Article.find(params[:article_id])
  end
end
