class AddProblemToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :problem, :text
  end
end
