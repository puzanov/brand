class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery
  helper :all
  include ApplicationHelper 
  def only_for_admin
    unless is_admin
      render :status => :forbidden, :action => "auth/forbidden"
    end
  end

  def init_user
    @user = User.find(params[:id])
  end

  def owner?
    unless session[:user].id == @user.id || is_admin
      render :status => :forbidden, :action => "auth/forbidden"
    end
  end

  def set_locale
    I18n.locale = I18n.default_locale    
  end

end
