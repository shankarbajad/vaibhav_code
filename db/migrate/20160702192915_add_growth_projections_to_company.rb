class AddGrowthProjectionsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :growth_projections, :string
  end
end
