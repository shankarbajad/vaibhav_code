class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.integer :user_id
      t.string :photo

      t.timestamps null: false
    end
    add_index(:user_photos, :user_id) unless index_exists?(:user_photos, :user_id)
  end
end
