class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]  
  # caches_page :index
  # caches_action :index
  # GET /companies
  # GET /companies.json
  def index
    @grouped_companies = Company.all.group_by(&:geography)    
    @companies = params[:q] ? company_filteration(params[:q],params[:region]) : Company.all
    render layout: "browse"
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
     if  user_signed_in?
    else
      redirect_to root_path
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company.sign_documents.new
  end

  # GET /companies/1/edit
  def edit
   if current_user && (@company.creator_id.eql?(current_user.id) || current_user.admin?)
    @company.sign_documents.new if !@company.sign_documents.present?
    else
      respond_to do |format|
        flash[:danger] = 'Unauthorized user!'
        format.html { redirect_to root_path }
      end
    end    
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        update_staffs
        docusign @company, params[:company][:sign_documents_attributes]
        # if company_params[:background_image].present?
        #   redirect_to company_crop_url(@company) and return
        # else
        image_cropping
          format.html { redirect_to @company, notice: 'Company was successfully created.' }
          format.json { render :show, status: :created, location: @company }
        # end
      else
        flash[:danger] = @company.errors.full_messages[0]
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update    
    respond_to do |format|
      if @company.update(company_params)
        image_cropping
        docusign @company, params[:company][:sign_documents_attributes]
        update_staffs
        # if company_params[:background_image].present?
        #   redirect_to company_crop_url(@company) and return
        # else
          format.html { redirect_to @company, notice: 'Company was successfully updated.' }
          format.json { render :show, status: :ok, location: @company }
        # end
      else
        flash[:danger] = @company.errors.full_messages[0]
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy    
    respond_to do |format|
      if current_user && (@company.creator_id.eql?(current_user.id) || current_user.admin?)
        @company.destroy
        format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
        format.json { head :no_content }
      else
        flash[:danger] = 'Unauthorized user!'
        format.html { redirect_to root_path }
      end
    end
  end

  def crop
    @company = Company.find(params[:company_id])
  end

  def get_cities_by_country_code; end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:staff_users, :name, :city, :country, :creator_id, :logo, :motto, :founded, :seeking, :raised, :tag, :industry, :amount_raised, :no_of_employees, :no_of_founders, :fundraising_amount, :company_website, :description, :readiness, :projections, :facebook, :twitter, :linkedin, :angellist, :country_of_incorporation, :growth_projections, :geography, :product_stage, :vision, :problem, :solution, :impact, :background_image, :background_image_crop_x, :background_image_crop_y, :background_image_crop_w, :background_image_crop_h, :company_documents_attributes => [:id, :document, :company_id, :_destroy], :sign_documents_attributes => [:id, :document, :company_id, :_destroy], :company_photos_attributes => [:id, :company_image, :_destroy], :videos_attributes => [:id, :title, :link, :description, :company_id, :_destroy], :user_ids => [], :updates_attributes => [:id, :title, :brief_description, :detailed_description, :_destroy])
    end

    def update_staffs
      if params["staff_users"].present?
        @company.staffs.destroy_all
        params["staff_users"].each do |role,user_ids|
          user_ids.reject!{|id| id.blank? }
          user_ids.each do |user_id|
            @company.staffs.create(:user_id => user_id, :role => role)
          end
        end
      end

    end


    def company_filteration(q,region)
      if region.eql?("All Regions") && q.blank?
        Company.all
      elsif region.eql?("All Regions") && !q.blank?
        Company.where("LOWER(name)=?", q.downcase)
      elsif q.blank?
        Company.where("geography=?", region)
      elsif !q.blank?
        Company.where("LOWER(name)=? AND geography=?", q.downcase, region)
      end
    end

    def image_cropping      
      if params[:crop].present?
        crop = JSON.parse(params[:crop])
        params[:company][:background_image_crop_x] = crop["left"]
        params[:company][:background_image_crop_y] = crop["top"]
        params[:company][:background_image_crop_w] = crop["width"]
        params[:company][:background_image_crop_h] = crop["height"]
        image = MiniMagick::Image.open(@company.background_image.url)        
        crop_params = "#{crop["width"]}x#{crop["height"]}+#{crop["left"]}+#{crop["top"]}"        
        image.crop(crop_params)
        image
        @company.background_image = image
        @company.update(company_params)
      end
    end
  
    def file_decode(base, filename)
      file = Tempfile.new([file_base_name(filename), file_extn_name(filename)])
      file.binmode
      file.write(Base64.decode64(base))
      file.close
      file
    end

    def file_base_name(file_name)
        File.basename(file_name, file_extn_name(file_name))
    end

    def file_extn_name(file_name)
        File.extname(file_name)
    end

end
