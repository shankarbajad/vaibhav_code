class CreatePastInvestments < ActiveRecord::Migration
  def change
    create_table :past_investments do |t|
      t.string :name
      t.string :company
      t.string :product
      t.string :funding_stage
      t.integer :year
      t.boolean :still_holding, :boolean, :default => :false
      t.boolean :impact_investment, :boolean, :default => :false

      t.timestamps null: false
    end
  end
end
