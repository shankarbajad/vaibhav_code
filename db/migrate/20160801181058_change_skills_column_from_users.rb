class ChangeSkillsColumnFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :skills, "varchar[] USING (string_to_array(skills, ','))", :default => []
  end
end
