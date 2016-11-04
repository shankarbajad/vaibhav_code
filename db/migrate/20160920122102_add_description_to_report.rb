class AddDescriptionToReport < ActiveRecord::Migration
  
  def change
  	add_column :reports, :description, :text
  end
  
end
