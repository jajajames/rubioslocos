class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def human_time(time)
    time.to_date.to_s.humanize.slice(2,9)
  end
end
