class CreateEducationSchools < ActiveRecord::Migration
  def change
    create_table :education_schools do |t|
    	t.string :area_of_study
    	t.string :degree
    	t.string :school
      t.timestamps null: false
    end
  end
end
