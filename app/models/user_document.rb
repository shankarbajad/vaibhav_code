class UserDocument < ActiveRecord::Base
  belongs_to :user

  mount_uploader :document, DocumentUploader

end
