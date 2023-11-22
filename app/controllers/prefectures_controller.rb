class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @articles = @prefecture.articles
  end
end
