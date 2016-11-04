class CreateLegalNotices < ActiveRecord::Migration
  def change
    create_table :legal_notices do |t|
      t.text :company_notice	
      t.text :investment_notice
      t.timestamps null: false
    end
  end
end
