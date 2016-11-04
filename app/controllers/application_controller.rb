class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  layout "minimal"

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    # @user = current_user
    # user_path(@user)
    users_path
  end

  def after_sign_up_path_for(resource)
    user_location_path
    user_path(@user)
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'edit'
      "application"
    elsif devise_controller?
      "minimal"
    end
  end

  def authenticate_admin_user!
    unless user_signed_in? && current_user.role.to_s == 'admin'
      redirect_to root_url, notice: "You dont have enough permission to access this portion of site."
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [:Founders, :Management, :Advisor, :Investor, :admin] }, :name, :email, :password, :password_confirmation, :profile, :company, :title, :avatar, :skills, :services)
    end
  end

  def docusign model, sign_doc
    Api::DocuSign.new(model.class.name, model.id, 'https://demo.docusign.net/restapi/v2/login_information',sign_doc["0"][:document].tempfile) if sign_doc && sign_doc["0"][:document]
  end
  
end