class AddUserIdToPastInvestment < ActiveRecord::Migration
  def change
    add_column :past_investments, :user_id, :integer
  end
end
