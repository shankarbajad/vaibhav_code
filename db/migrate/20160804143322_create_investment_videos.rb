class CreateInvestmentVideos < ActiveRecord::Migration
  def change
    create_table :investment_videos do |t|
      t.integer :investment_id
      t.string :title
      t.text :link
      t.text :description
      t.text :tags

      t.timestamps null: false
    end
    add_index(:investment_videos, :investment_id) unless index_exists?(:investment_videos, :investment_id)
  end
end
