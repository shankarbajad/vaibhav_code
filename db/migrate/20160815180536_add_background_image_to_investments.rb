class AddBackgroundImageToInvestments < ActiveRecord::Migration
  def change
    add_column :investments, :background_image, :string
  end
end
