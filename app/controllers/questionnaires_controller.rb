class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy, :change_status]
  before_action :set_company

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    # @questionnaires = Questionnaire.all    
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = current_user.questionnaires.new(questionnaire_params)
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to company_questionnaire_path(@questionnaire.company, @questionnaire), notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire }        
      else        
        flash[:danger] = @questionnaire.errors.full_messages.join(', ')
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to company_questionnaire_path(@questionnaire.company, @questionnaire), notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        flash[:danger] = @questionnaire.errors.full_messages.join(', ')
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy     
    respond_to do |format|
      format.html { redirect_to company_questionnaires_path(@company), notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_status
    @questionnaire.update(status: true)
    QuestionnaireMailer.send_notification(@questionnaire).deliver
    QuestionnaireMailer.send_notification_to_team(@questionnaire).deliver
    # QuestionnaireMailer.accept_questionnaire(@questionnaire).deliver
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Questionnaire Status was successfully send, We will contact you soon.' }
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit!
      # params.require(:questionnaire).permit(:company_founder_1, :company_founder_2, :company_founder_3, :company_founder_4, :company_name, :company_website, :year_founded, :elevator_pitch, :interesting_why, :motivation, :product_stage, :financial_stage, :burn_rate, :revenue, :current_month_revenue, :ebitda_estimate, :risks_overview, :core_competency, :greatest_challenge, :opportunity, :critical_cost, :worst_case_scenario, :customers, :customers_overview, :customer_location, :customer_consumption, :customer_motivation, :customer_drivers, :distribution_power, :supply_power, :pricing_strategy, :company_evolution, :cofounder_story, :skills_mix_1, :skills_mix_2, :management_team_status, :management_team_filled_roles, :management_city_location, :past_experience_relevancy, :time_investment, :full_time_employees, :early_stage_experience, :location_relevancy, :contributed_capital, :management_earnings, :alternative_interest)
    end

    def set_company
      @company = Company.find(params[:company_id])      
    end
end
