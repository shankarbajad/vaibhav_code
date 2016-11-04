class AddtoFieldsToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :company_id, :integer
  	add_column :reports, :investment_id, :integer
  end
end
