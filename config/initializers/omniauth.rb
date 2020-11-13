Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['405269217274807'], ENV['c53b26f5d9247290107bfad6c9698900']
end