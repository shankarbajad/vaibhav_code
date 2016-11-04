class AddUserIdToQuestionnaire < ActiveRecord::Migration
  def change
    add_column :questionnaires, :user_id, :integer
    add_column :questionnaires, :status, :integer, default: false
  end
end
