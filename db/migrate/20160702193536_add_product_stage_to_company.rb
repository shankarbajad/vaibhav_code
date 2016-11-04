class AddProductStageToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :product_stage, :string
  end
end
