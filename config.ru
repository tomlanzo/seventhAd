# This file is used by Rack-based servers to start the application.
require 'rack/rewrite'
use Rack::Rewrite do
  r302 '/demo', '/game_sessions/5'
end

require_relative 'config/environment'

run Rails.application
