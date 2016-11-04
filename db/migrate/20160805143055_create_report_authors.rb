class CreateReportAuthors < ActiveRecord::Migration
  def change
    create_table :report_authors do |t|
      t.integer :report_id
      t.integer :author_id

      t.timestamps null: false
    end
    add_index(:report_authors, :report_id) unless index_exists?(:report_authors, :report_id)
    add_index(:report_authors, :author_id) unless index_exists?(:report_authors, :author_id)
  end
end
