class CompanyDocument < ActiveRecord::Base
  belongs_to :company

  mount_uploader :document, DocumentUploader
end
