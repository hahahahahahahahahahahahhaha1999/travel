class PrefecturesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @prefectures = Prefecture.all
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @articles = @prefecture.articles.order('created_at DESC')
  end
end
