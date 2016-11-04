class AddGeographyToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :geography, :string
  end
end
