module ApplicationHelper

  def get_current_event
    @current_event = Event.last
  end

  def is_admin
    return false if session[:user].nil? 
    session[:user].role == 'admin'
  end
end
