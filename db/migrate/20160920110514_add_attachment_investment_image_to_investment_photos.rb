class AddAttachmentInvestmentImageToInvestmentPhotos < ActiveRecord::Migration
  def self.up
    change_table :investment_photos do |t|
      t.attachment :investment_image
    end
  end

  def self.down
    remove_attachment :investment_photos, :investment_image
  end
end
