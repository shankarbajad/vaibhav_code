class AddMoreColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :no_of_employees, :string
    add_column :companies, :no_of_founders, :string
    add_column :companies, :fundraising_amount, :string
    add_column :companies, :company_website, :string
    add_column :companies, :description, :text
    add_column :companies, :readiness, :text
    add_column :companies, :projections, :text
    add_column :companies, :facebook, :string
    add_column :companies, :twitter, :string
    add_column :companies, :linkedin, :string
    add_column :companies, :angellist, :string
  end

end
