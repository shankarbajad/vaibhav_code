class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :admin_only, :except => :show
  
  def index    
    @grouped_users = User.group(:location).count
    # @users = User.order(:name => :asc)
    get_users    
    respond_to do |format|
      format.js
      format.html { render layout: "browse" }
    end
    
  end

  def show
    @user = User.find params[:id]
    render layout: "application"

    # unless current_user.admin? && @user == current_user
    #     redirect_to :back, :alert => "Access denied."
    # end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      if secure_params[:background_image_crop_x].present?
        redirect_to edit_user_registration_path and return
      else
        redirect_to users_path, :notice => "User updated."
      end
    else
      redirect_to users_path, :alert => "#{@user.errors.full_messages}\n\nUnable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def crop
    render :layout => 'application'
  end

  def filter_courses
    @education_degree = EducationSchool.where(area_of_study: params[:study_type])
  end

  def get_cities_by_country_code; end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:name, :email, :current_password, :password, :password_confirmation, :role, :profile, :company, :title, :avatar, :skills, :services, 
      :brief_description, :bio, :keyword_tags, :phone_number, :city, :country, :skype_id, :website, :undergrad_school, :background_image, :background_image_crop_x, :background_image_crop_y, :background_image_crop_w, :background_image_crop_h)
    
  end

  def network
    @users = User.all
  end

  def get_users
    if params[:industry].present? && params[:industry].eql?("All Industries")
      @users = PastInvestment.all.collect(&:by_user)
    elsif params[:industry].present? && !params[:industry].eql?("All Industries")
      @users = PastInvestment.where(industry: params[:industry]).collect(&:by_user)
    else
      @industries = PastInvestment.all.collect(&:industry).uniq.map{|i| Company::INDUSTRY.select{|key, value| key == i } }
      @industries = @industries.map{|indus| indus.first}
      @users = User.order(:name => :asc)
      @users = if params[:q].present? && (params[:region].eql?("All Regions") || !params[:region].present?)
        @users.where("LOWER(name) like ?", "#{params[:q].split(',')[0].downcase}%")
      elsif params[:q].present? && params[:region].present? && !params[:region].eql?("All Regions")
        @users.where("LOWER(name) like ? AND location = ?", "#{params[:q].split(',')[0].downcase}%",params[:region])
      elsif ( !params[:q].present? && params[:region].eql?("All Regions") ) || ( !params[:q].present? && !params[:region].present? )
        User.all
      elsif !params[:q].present? && !params[:region].eql?("All Regions")
        @users.where("location = ?", params[:region])
      end
    end
    @users = @users.uniq
  end
end
