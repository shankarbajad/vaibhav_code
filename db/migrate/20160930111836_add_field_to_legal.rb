class AddFieldToLegal < ActiveRecord::Migration
  def change
    add_column :legals, :company_id, :integer
    add_column :legals, :investment_id, :integer
  end
end
