class InvestmentDocument < ActiveRecord::Base
  belongs_to :investment

  mount_uploader :document, DocumentUploader
end
