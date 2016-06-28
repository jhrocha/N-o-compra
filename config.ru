# This file is used by Rack-based servers to start the application.

require 'rack/cors'

# The CORS spec allows web applications to make cross domain AJAX calls without using workarounds such as JSONP
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete]
  end
end

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
