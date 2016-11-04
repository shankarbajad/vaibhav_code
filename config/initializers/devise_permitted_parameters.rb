module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [:advisor, :investor, :entrepreneur, :management, :admin] }, :name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ roles: [:advisor, :investor, :entrepreneur, :management, :admin] }, :name, :email, :password, :password_confirmation, :profile, :company, :title, :avatar, :skills, :services)
    end
  end

end

DeviseController.send :include, DevisePermittedParameters
