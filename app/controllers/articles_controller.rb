class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to prefecture_path(@article.prefecture), notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to prefecture_path(@article.prefecture), notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :image, :check_in, :check_out, :partner_id, :price, :travel_site_id, :content,
                                   :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @article = Article.find(params[:id])
  end
end
