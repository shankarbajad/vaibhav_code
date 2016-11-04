class AddCompanyCountryCity < ActiveRecord::Migration
  def change
    add_column :companies, :country, :string
    add_column :companies, :city, :string
  end
end
