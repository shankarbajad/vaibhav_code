class InvestmentPhoto < ActiveRecord::Base
  belongs_to :investment

  mount_uploader :photo, PhotoUploader

  has_attached_file :investment_image
  validates_attachment_presence :investment_image
  validates_attachment_content_type :investment_image, :content_type => ['image/jpeg', 'image/png']
end
