class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :report_category_id
      t.integer :created_by_id
      t.integer :last_updated_by_id
      t.string  :document
      t.datetime :published_at
      t.integer :status, :default => 0

      t.timestamps null: false
    end
    add_index(:reports, :report_category_id) unless index_exists?(:reports, :report_category_id)
    add_index(:reports, :created_by_id) unless index_exists?(:reports, :created_by_id)
    add_index(:reports, :last_updated_by_id) unless index_exists?(:reports, :last_updated_by_id)
  end
end
