class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :brief_description, :string
    add_column :users, :bio, :text
    add_column :users, :keyword_tags, :string
    add_column :users, :phone_number, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :skype_id, :string
    add_column :users, :website, :string
    add_column :users, :undergrad_school, :string
    add_column :users, :undergrad_major, :string
    add_column :users, :undergrad_graduation_year, :string
    add_column :users, :graduate_school, :string
    add_column :users, :graduate_major, :string
    add_column :users, :graduate_graduation_year, :string
    add_column :users, :experience_highlights_1, :string
    add_column :users, :experience_highlights_2, :string
    add_column :users, :experience_highlights_3, :string
    add_column :users, :experience_highlights_4, :string
    add_column :users, :experience_highlights_5, :string
    add_column :users, :experience_highlights_6, :string
    add_column :users, :experience_highlights_7, :string
    add_column :users, :experience_highlights_8, :string
    add_column :users, :experience_highlights_9, :string
    add_column :users, :experience_highlights_10, :string
    add_column :users, :interest_1, :string
    add_column :users, :interest_2, :string
    add_column :users, :interest_3, :string
    add_column :users, :investment_company_1, :text
    add_column :users, :investment_type_1, :string
    add_column :users, :investment_year_1, :integer
    add_column :users, :investment_stage_1, :string
    add_column :users, :investment_company_2, :text
    add_column :users, :investment_type_2, :string
    add_column :users, :investment_year_2, :integer
    add_column :users, :investment_stage_2, :string
    add_column :users, :investment_company_3, :text
    add_column :users, :investment_type_3, :string
    add_column :users, :investment_year_3, :integer
    add_column :users, :investment_stage_3, :string
    add_column :users, :angelist_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :facebook_url, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :investment_size, :string
    add_column :users, :company_stage, :string
    add_column :users, :industries, :string
    add_column :users, :sectors, :string
    add_column :users, :preferences, :text
    add_column :users, :experience_level, :string
  end
end
