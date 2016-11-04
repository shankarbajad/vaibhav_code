class AddLogoToInvestments < ActiveRecord::Migration
  def change
    add_column :investments, :logo, :string
  end
end
