class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.integer :company_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :staffs, [:company_id, :user_id] unless index_exists?(:staffs, [:company_id, :user_id])
  end
end
