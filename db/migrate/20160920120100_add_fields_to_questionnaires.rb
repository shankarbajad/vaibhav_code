class AddFieldsToQuestionnaires < ActiveRecord::Migration
  def change
    add_column :questionnaires, :first_name, :string
    add_column :questionnaires, :family_name, :string
    add_column :questionnaires, :email, :string
    add_column :questionnaires, :founder, :string
    add_column :questionnaires, :company_business_type, :string
    add_column :questionnaires, :product_service, :text

    add_column :questionnaires, :distribution_channel, :string
    add_column :questionnaires, :management_spending, :string
    add_column :questionnaires, :management_team_relationship, :string
    add_column :questionnaires, :management_team_invest, :string
    add_column :questionnaires, :not_working_with_business, :text

    add_column :questionnaires, :management_passionate, :text
    add_column :questionnaires, :key_strengths, :string
    add_column :questionnaires, :improvement_strength, :string
    add_column :questionnaires, :company_industry, :string
    add_column :questionnaires, :primarily_operate_country, :text
    add_column :questionnaires, :market_acceptance, :string
    add_column :questionnaires, :customers_experiment, :text
    add_column :questionnaires, :market_size, :string
    add_column :questionnaires, :market_size_in_5_year, :string
    add_column :questionnaires, :determine_numbers, :string
    add_column :questionnaires, :business_projection_within_5_years, :string
    
    add_column :questionnaires, :customer_base_grow, :text
    add_column :questionnaires, :competitive_position, :string
    add_column :questionnaires, :product_substitutes, :string
    add_column :questionnaires, :market_barrier, :text
    add_column :questionnaires, :customer_identification, :string
    add_column :questionnaires, :fund_description, :text
    add_column :questionnaires, :participate, :string
    add_column :questionnaires, :finance_type, :string
    add_column :questionnaires, :fund_estimate, :text
    add_column :questionnaires, :fund_close_estimate, :string
    add_column :questionnaires, :fund_time_period, :string
    add_column :questionnaires, :fund_change_plan, :text
    add_column :questionnaires, :hear_about_us_by, :text
    add_column :questionnaires, :management_linkedin_url, :string
    add_column :questionnaires, :linkedin_url, :string
    add_column :questionnaires, :suggestion, :string
    add_column :questionnaires, :company_id, :integer

  end
end
