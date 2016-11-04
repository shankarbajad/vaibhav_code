class CreateUserDocuments < ActiveRecord::Migration
  def change
    create_table :user_documents do |t|
      t.integer :user_id
      t.string :document

      t.timestamps null: false
    end
    add_index(:user_documents, :user_id) unless index_exists?(:user_documents, :user_id)
  end
end
