class CreateUserVideos < ActiveRecord::Migration
  def change
    create_table :user_videos do |t|
      t.integer :user_id
      t.string :title
      t.text :link
      t.text :description
      t.text :tags

      t.timestamps null: false
    end
    add_index(:user_videos, :user_id) unless index_exists?(:user_videos, :user_id)
  end
end
