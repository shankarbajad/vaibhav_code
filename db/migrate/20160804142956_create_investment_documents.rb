class CreateInvestmentDocuments < ActiveRecord::Migration
  def change
    create_table :investment_documents do |t|
      t.integer :investment_id
      t.string :document

      t.timestamps null: false
    end
    add_index(:investment_documents, :investment_id) unless index_exists?(:investment_documents, :investment_id)
  end
end
