class CompanyPhoto < ActiveRecord::Base
  belongs_to :company

  mount_uploader :photo, PhotoUploader
  crop_uploaded :photo
  has_attached_file :company_image
  validates_attachment_presence :company_image
  validates_attachment_content_type :company_image, :content_type => ['image/jpeg', 'image/png']
end
