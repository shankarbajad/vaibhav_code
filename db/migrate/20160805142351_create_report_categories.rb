class CreateReportCategories < ActiveRecord::Migration
  def change
    create_table :report_categories do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
