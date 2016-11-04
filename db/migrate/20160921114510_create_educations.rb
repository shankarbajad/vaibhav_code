class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :level
      t.string :area_of_study
      t.string :school
      t.integer :passing_year

      t.timestamps null: false
    end
  end
end
