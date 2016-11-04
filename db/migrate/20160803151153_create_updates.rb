class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.text :brief_description
      t.text :detailed_description
      t.references :updateable, :polymorphic => true, :index => true

      t.timestamps null: false
    end
  end
end
