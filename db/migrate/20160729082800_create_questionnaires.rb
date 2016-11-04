class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :company_founder_1
      t.integer :company_founder_2
      t.integer :company_founder_3
      t.integer :company_founder_4
      t.string :company_name
      t.string :company_website
      t.string :year_founded
      t.text :elevator_pitch
      t.text :interesting_why
      t.text :motivation
      t.string :product_stage
      t.string :financial_stage
      t.string :burn_rate
      t.string :revenue
      t.string :current_month_revenue
      t.string :ebitda_estimate
      t.text :risks_overview
      t.text :core_competency
      t.text :greatest_challenge
      t.text :opportunity
      t.text :critical_cost
      t.text :worst_case_scenario
      t.string :customers
      t.text :customers_overview
      t.text :customer_location
      t.text :customer_consumption
      t.text :customer_motivation
      t.string :customer_drivers
      t.string :distribution_power
      t.string :supply_power
      t.text :pricing_strategy
      t.text :company_evolution
      t.text :cofounder_story
      t.text :skills_mix_1
      t.text :skills_mix_2
      t.string :management_team_status
      t.string :management_team_filled_roles
      t.string :management_city_location
      t.string :past_experience_relevancy
      t.string :time_investment
      t.string :full_time_employees
      t.string :early_stage_experience
      t.string :location_relevancy
      t.string :contributed_capital
      t.string :management_earnings
      t.text :alternative_interest

      t.timestamps null: false
    end
  end
end
