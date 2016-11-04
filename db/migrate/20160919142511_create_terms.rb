class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
    	t.string :investment_interested
    	t.string :investment_experience
    	t.text :description
    	t.integer :user_id 
      t.timestamps null: false
    end
  end
end
