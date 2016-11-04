class CreateTermSheets < ActiveRecord::Migration
  def change
    create_table :term_sheets do |t|
    	t.integer :investment_id
    	t.string :description
    	t.string :security
    	t.string :automatic_conversion
    	t.float :interest_rate
    	t.string :interest_payments
    	t.date :maturity_date
    	t.float :conversion_discount
    	t.integer :conversion_cap
    	t.string :optional_conversion
    	t.string :redemption_option
    	t.integer :min_investment_for_vestedAngels
    	t.integer :min_Raise_through_vestedAngels
		t.integer :max_raise_through_vestedAngels
		t.integer :maximum_fund_investors
		t.integer :management_fee
		t.float :maximum_fund_investors
		t.integer :carried_interest
		t.string :administrative_cost
		t.date :target_closing_date
		t.string :other
		

      t.timestamps null: false
    end
  end
end
