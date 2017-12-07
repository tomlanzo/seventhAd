class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def disable_nav_footer
    @disable_nav_footer = true
  end
end
