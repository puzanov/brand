class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  include ApplicationHelper 
  def only_for_admin
    unless is_admin
      render :status => :forbidden, :action => "auth/forbidden"
    end
  end
end
