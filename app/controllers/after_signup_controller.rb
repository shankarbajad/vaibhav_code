class AfterSignupController < ApplicationController
	include Wicked::Wizard
	steps :location, :welcome, :setup
	layout "minimal"


	def show
		@user = current_user
		render_wizard
	end

	def update
		@user = current_user
		unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(params[:user])
		@user.update_attributes(unlocked_params) if unlocked_params.present?
		render_wizard @user
	end

	def finish_wizard_path
  	 edit_user_registration_path(current_user)
	end

	private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :company, :title, :avatar, :services, :location, :skills => [])
	end

end
