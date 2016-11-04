class AddAttachmentCompanyImageToCompanyPhotos < ActiveRecord::Migration
  def self.up
    change_table :company_photos do |t|
      t.attachment :company_image
    end
  end

  def self.down
    remove_attachment :company_photos, :company_image
  end
end
