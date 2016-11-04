class CreateInvestmentPhotos < ActiveRecord::Migration
  def change
    create_table :investment_photos do |t|
      t.integer :investment_id
      t.string :photo

      t.timestamps null: false
    end
    add_index(:investment_photos, :investment_id) unless index_exists?(:investment_photos, :investment_id)
  end
end
