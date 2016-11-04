class Staff < ActiveRecord::Base
  enum role: [:Founders, :Management, :Advisor, :Investor, :admin]
  
  belongs_to :company
  belongs_to :user
end
