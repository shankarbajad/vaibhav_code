class CreateCompanyDocuments < ActiveRecord::Migration
  def change
    create_table :company_documents do |t|
      t.integer :company_id
      t.string :document

      t.timestamps null: false
    end
  end
end
