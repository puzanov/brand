class HomeController < ApplicationController
  def index
    puts params[:locale]
    @articles = Article.order("id desc").limit(2);
    @short_articles = Article.order("id desc").limit(5).offset(2);
  end
end
