class AddAttachmentUserImageToUserPhotos < ActiveRecord::Migration
  def self.up
    change_table :user_photos do |t|
      t.attachment :user_image
    end
  end

  def self.down
    remove_attachment :user_photos, :user_image
  end
end
