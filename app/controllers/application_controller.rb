class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_cors

  def configure_cors
    return unless ALLOW_ORIGINS.include?(request.origin)

    response.headers['Access-Control-Allow-Origin'] = request.origin
  end
end
