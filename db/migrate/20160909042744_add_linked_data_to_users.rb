class AddLinkedDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :industry, :string
  end
end
