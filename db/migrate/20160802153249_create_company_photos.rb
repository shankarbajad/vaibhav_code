class CreateCompanyPhotos < ActiveRecord::Migration
  def change
    create_table :company_photos do |t|
      t.integer :company_id
      t.string :photo

      t.timestamps null: false
    end
  end
end
