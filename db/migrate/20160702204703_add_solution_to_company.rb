class AddSolutionToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :solution, :text
  end
end
