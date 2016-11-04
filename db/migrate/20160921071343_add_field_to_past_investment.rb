class AddFieldToPastInvestment < ActiveRecord::Migration
  def change
    add_column :past_investments, :industry, :string
  end
end
