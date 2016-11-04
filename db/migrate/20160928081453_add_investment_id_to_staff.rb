class AddInvestmentIdToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :investment_id, :integer
  end
end
