class AddBackgroundImageToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :background_image, :string
  end
end
