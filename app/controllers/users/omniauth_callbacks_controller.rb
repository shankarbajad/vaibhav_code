 class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def linkedin
  	@exiting_user = User.find_by_email(request.env["omniauth.auth"].extra.raw_info.emailAddress) 
  	if @exiting_user.present?
  		sign_in @exiting_user, :event => :authentication
      redirect_to users_path, :notice => "You have been connected with Linkedin successfully!!"
  	else
	    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)
	    if @user.persisted?
	      sign_in @user, :event => :authentication
	      redirect_to user_welcome_path, :notice => "You have been connected with Linkedin successfully!!"
	    else
	      redirect_to root_url, :notice => "Something went wrong!"
	    end
		end
  end
end
