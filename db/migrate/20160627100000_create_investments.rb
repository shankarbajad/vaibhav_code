class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :title
      t.integer :size
      t.text :description
      t.integer :type
      t.integer :revenue_share
      t.date :start_date
      t.date :end_date
      t.integer :company_id
      t.string :industry
      t.string :stage
      t.string :location
      t.integer :expected_return

      t.timestamps null: false
    end
  end
end
