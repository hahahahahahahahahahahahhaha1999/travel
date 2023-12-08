class LikesController < ApplicationController
 

  def index
    @articles = Article.includes(:article_images).order("created_at DESC")
    likes = Like.where(user_id: current_user.id).pluck(:article_id)
    @like_list = Article.find(likes)
  end


  def create
    @article = Article.find(params[:article_id])
    like = current_user.likes.build(article_id: params[:article_id])
    like.save
    respond_to do |format|
      format.js
    end 
  end

  def destroy
    @article = Article.find(params[:article_id])
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
