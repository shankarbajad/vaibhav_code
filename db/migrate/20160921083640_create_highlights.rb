class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :hightlight_type
      t.string :highlight_title
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
