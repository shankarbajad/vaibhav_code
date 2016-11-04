class AddInvestorIdToInvestments < ActiveRecord::Migration
  def change
    add_column :investments, :investor_id, :integer
    add_index(:investments, :investor_id) unless index_exists?(:investments, :investor_id)
  end
end
