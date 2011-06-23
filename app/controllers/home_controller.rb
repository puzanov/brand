class HomeController < ApplicationController
  def index
    @articles = Article.order("id desc").limit(2);
  end
end
