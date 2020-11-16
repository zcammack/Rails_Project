# frozen_string_literal: true

class Dungeonmasters::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /dungeonmasters/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    @dungeonmaster = Dungeonmaster.from_omniauth(request.env["omniauth.auth"])

    if @dungeonmaster.persisted?
        sign_in_and_redirect @dungeonmaster, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
        session["devise.facebok_data"] = request.env["omniauth.auth"]
        redirect_to new_dungeonmaster_registration_url
    end
end

def failure
    redirect_to root_path
end
end
