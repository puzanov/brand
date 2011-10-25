class HomeController < ApplicationController
  def index
    puts params[:locale]
    @articles = Article.order("id desc").limit(15);
    @common_price = CommonPrice.order("id desc").limit(1);
  end
end
