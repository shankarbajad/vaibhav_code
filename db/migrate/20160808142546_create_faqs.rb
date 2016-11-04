class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :question
      t.text :answer
      t.text :content
      t.string :tags

      t.timestamps null: false
    end
  end
end
