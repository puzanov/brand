module ApplicationHelper
  def get_current_event
    @current_event = Event.last
  end
end
