class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  # GET /investments
  # GET /investments.json
  def index
    @users = User.all
    @grouped_investments = Investment.group(:location).count
    @investments = Investment.order(:title => :asc)
    @investments = @investments.where("LOWER(title)=?", params[:q].downcase) if params[:q].present?


    render layout: "browse"
  end

  # GET /investments/1
  # GET /investments/1.json
  def show
     if  user_signed_in?
      response.headers.delete "X-Frame-Options"
    else
      redirect_to root_path
    end
  end

  # GET /investments/new
  def new
    if current_user.admin?
      @investment = Investment.new
      @investment.build_term_sheet
    else
      flash[:danger] = "You are not unauthorized access this."
      redirect_to root_url
    end

  end

  # GET /investments/1/edit
  def edit
    if current_user && (@investment.investor_id.eql?(current_user.id) || current_user.admin?)
    else
      respond_to do |format|
        flash[:danger] = 'Unauthorized user!'
        format.html { redirect_to root_path }
      end
    end
  end

  # POST /investments
  # POST /investments.json
  def create
    @investment = Investment.new(investment_params)

    respond_to do |format|
      @investment.investor = current_user
      if @investment.save
        update_staffs
        format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
        format.json { render :show, status: :created, location: @investment }
      else
        flash[:danger] = @investment.errors.full_messages.join(', ')
        format.html { render :new }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investments/1
  # PATCH/PUT /investments/1.json
  def update
    respond_to do |format|
      if @investment.update(investment_params)
        update_staffs
        if investment_params[:background_image].present?
          redirect_to investment_crop_url(@investment) and return
        else
          format.html { redirect_to @investment, notice: 'Investment was successfully updated.' }
          format.json { render :show, status: :ok, location: @investment }
        end
      else
        flash[:danger] = @investment.errors.full_messages.join(', ')
        format.html { render :edit }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    respond_to do |format|
      if current_user && (@investment.investor_id.eql?(current_user.id) || current_user.admin?)
        @investment.destroy  
        format.html { redirect_to investments_url, notice: 'Investment was successfully destroyed.' }
        format.json { head :no_content }
      else
        flash[:danger] = 'Unauthorized user!'
        format.html { redirect_to root_path }
      end
    end
  end

  def crop
    @investment = Investment.find(params[:investment_id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:title, :size, :description, :type, :revenue_share, :start_date, :logo,:end_date, :company_id, :industry, :stage, :staff_users, :location, :expected_return, :background_image, :background_image_crop_x, :background_image_crop_y, :background_image_crop_w, :background_image_crop_h, :highlights_1,:highlights_2, :highlights_3, :highlights_4, :highlights_5, :highlights_6, :highlights_7, :highlights_8, :highlights_9, :highlights_10, :overview_1, :overview_2, :overview_3, :problem_bullet_1, :problem_bullet_2, :problem_bullet_3, :problem_bullet_4, :problem_bullet_5,:solution_bullet_1, :solution_bullet_2, :solution_bullet_3, :solution_bullet_4, :solution_bullet_5,:updates_attributes => [:id, :title, :brief_description, :detailed_description, :_destroy], :user_ids => [], :investment_photos_attributes => [:id, :investment_image,  :_destroy], :investment_documents_attributes => [:id, :document, :investment_id, :_destroy], :investment_videos_attributes => [:id, :title, :link, :description, :investment_id, :_destroy],:term_sheet_attributes => [:id, :investment_id, :description, :security, :automatic_conversion, :interest_rate, :interest_payments, :maturity_date, :conversion_discount, :conversion_cap, :optional_conversion, :redemption_option, :min_investment_for_vestedAngels, :min_Raise_through_vestedAngels, :max_raise_through_vestedAngels, :maximum_fund_investors, :management_fee, :carried_interest, :administrative_cost, :target_closing_date, :other])
    end

    def update_staffs
      if params["staff_users"].present?
        @investment.staffs.destroy_all
        params["staff_users"].each do |role,user_ids|
          user_ids.reject!{|id| id.blank? }
          user_ids.each do |user_id|
            @investment.staffs.create(:user_id => user_id, :role => role)
          end
        end
      end

    end
end