class AddFundPlanToQuestionnaire < ActiveRecord::Migration
  def change
    add_column :questionnaires, :fund_plan, :string    
    change_column :questionnaires, :fund_close_estimate, 'date USING CAST(fund_close_estimate AS date)'

  end
end
