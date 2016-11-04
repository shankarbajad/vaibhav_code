class CreateSignDocuments < ActiveRecord::Migration
  def change
    create_table :sign_documents do |t|
      t.string :document
      t.integer :documentable_id
      t.string :documentable_type
      	
      t.timestamps null: false
    end
  end
end
