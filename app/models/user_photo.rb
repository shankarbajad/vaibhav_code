class UserPhoto < ActiveRecord::Base
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  has_attached_file :user_image
  validates_attachment_presence :user_image
  validates_attachment_content_type :user_image, :content_type => ['image/jpeg', 'image/png']

end
