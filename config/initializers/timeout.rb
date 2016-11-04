# Rack::Timeout.timeout = 24  # seconds4
Rails.application.config.middleware.insert_before Rack::Runtime, Rack::Timeout, service_timeout: 75