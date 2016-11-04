class RegistrationsController < Devise::RegistrationsController
	
	def update
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @user.update_attributes(account_update_params)
    @user.update(skills: params[:user][:skills])
    docusign @user, params[:user][:sign_documents_attributes]
    image_cropping
    if @user.errors.present?
      flash[:danger] = @user.errors.full_messages.join(', ')
    else
      flash[:notice] = "Account was successfully updated."
    end
    redirect_to :back
  end

  def edit
    if (current_user && ((current_user.admin? || current_user.id.eql?(params[:format].to_i)) || params[:format].nil?))
      @user = User.find(params[:format].to_i) if params[:format].present?
      @user.sign_documents.new if !@user.sign_documents.present?
    else
      flash[:danger] = 'Unauthorized user!'
      redirect_to root_url
    end
    
  end


  def image_cropping 
    if params[:crop].present?
      crop = JSON.parse(params[:crop])
      params[:user][:background_image_crop_x] = crop["left"]
      params[:user][:background_image_crop_y] = crop["top"]
      params[:user][:background_image_crop_w] = crop["width"]
      params[:user][:background_image_crop_h] = crop["height"]
      image = MiniMagick::Image.open(@user.background_image.url)        
      crop_params = "#{crop["width"]}x#{crop["height"]}+#{crop["left"]}+#{crop["top"]}"        
      image.crop(crop_params)
      image
      @user.background_image = image
      @user.update(account_update_params)
    end
  end

 	private

 	def sign_up_params
   		params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
 	end

 	def account_update_params
   		params.require(:user).permit(:background_image, :background_image_crop_x, :background_image_crop_y, :background_image_crop_w, :background_image_crop_h,:city, :country, :website, :name, :email,  :password, :password_confirmation, :role, :profile, :company, :title, :avatar, :tags, :brief_description, :bio, :phone_number, :skype_id,:skills, :services, :background_image,:highlights_attributes => [:id, :hightlight_type, :highlight_title,:_destroy], :educations_attributes => [:id, :level, :user_id, :area_of_study,:school,:passing_year,:_destroy],:past_investments_attributes => [:id, :created_by, :user_id,:name, :company,:industry,:product,:funding_stage,:year,:still_holding,:impact_investment, :_destroy], :updates_attributes => [:id, :title, :brief_description, :detailed_description, :_destroy], :user_photos_attributes => [:id, :user_image, :_destroy], :user_documents_attributes => [:id, :document, :user_id, :_destroy], :sign_documents_attributes => [:id, :document, :company_id, :_destroy], :user_videos_attributes => [:id, :title, :link, :description, :user_id, :_destroy])
 	end

 protected
	def after_sign_up_path_for(resource)
		after_signup_path(:location)
	end

	def after_update_path_for(resource)
		#after_signup_path(:location)
    if account_update_params[:background_image].present?
      image_cropping
    else
      edit_user_registration_path
    end
	end

end

