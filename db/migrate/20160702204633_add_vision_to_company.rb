class AddVisionToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :vision, :text
  end
end
