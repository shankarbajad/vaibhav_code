class AddImpactToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :impact, :text
  end
end
