class Investment < ActiveRecord::Base
  self.inheritance_column = :ruby_type

  validates :company_id, :presence => true

 	enum type: [:debt, :equity, :convertible]
  belongs_to :company

  belongs_to :investor, :class_name => "User", :foreign_key => "investor_id"

  has_many :updates, as: :updateable, :dependent => :destroy
  accepts_nested_attributes_for :updates, allow_destroy: true, :reject_if => Proc.new { |update| update['title'].blank? }

  has_many :investment_documents, :dependent => :destroy
  accepts_nested_attributes_for :investment_documents, reject_if: :all_blank, allow_destroy: true

  has_many :investment_photos, :dependent => :destroy
  accepts_nested_attributes_for :investment_photos, reject_if: :all_blank, allow_destroy: true

  has_many :investment_videos, :dependent => :destroy
  accepts_nested_attributes_for :investment_videos, allow_destroy: true, :reject_if => Proc.new { |investment_video| investment_video['link'].blank?  }

  has_one :term_sheet, :dependent => :destroy 
  accepts_nested_attributes_for :term_sheet, reject_if: :all_blank, allow_destroy: true
  has_many :users, :class_name => "User", :through => :staffs, :source => :user
  has_many :staffs, :dependent => :destroy
  
  mount_uploader :logo, PhotoUploader
  mount_uploader :background_image, PhotoUploader
  crop_uploaded :background_image


  after_create :send_investment_created_email

  private
  def send_investment_created_email
    InvestmentMailer.investment_created_mail(self).deliver
  end



end
