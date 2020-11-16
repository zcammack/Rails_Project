Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook,
             ENV['405269217274807'],
             ENV['c53b26f5d9247290107bfad6c9698900'],
             scope: 'email',
             info_fields: 'email',
             auth_type: 'rerequest'
  
    configure do |config|
      config.path_prefix = '/users/auth'
    end

    configure do |config|
        config.path_prefix = '/dungeonmasters/auth'
    end

    on_failure do |env|
        if env['omniauth.params'].present
          env["devise.mapping"] = Devise.mappings[:user]
        end
        Devise::OmniauthCallbacksController.action(:failure).call(env)
      end
  end