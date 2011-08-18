class HomeController < ApplicationController
  def index
    puts params[:locale]
    @articles = Article.order("id desc").limit(15);
  end
end
