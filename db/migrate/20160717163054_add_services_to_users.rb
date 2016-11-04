class AddServicesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :services, :string
  end
end
