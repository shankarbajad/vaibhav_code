class Report < ActiveRecord::Base
  enum status: [:saved, :published, :archived]
  belongs_to :report_category
  belongs_to :company
  belongs_to :investment
  has_many :report_authors, :dependent => :destroy
  has_many :authors, :through => :report_authors, :class_name => "User"

  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by_id"
  belongs_to :last_updated_by, :class_name => "User", :foreign_key => "created_by_id"

  mount_uploader :document, DocumentUploader

  attr_accessor :report_author_ids
  attr_reader :report_author_ids

  before_update :set_published_date
  after_update :send_report_published_email

  def report_author_ids=(ids)
    self.authors = User.where(:id => ids)
  end

  private
  def set_published_date
    self.published_at = Time.now if self.status_changed? and self.status == "published"
  end

  def send_report_published_email
    if self.status_changed? and self.status == "published"
      ReportMailer.report_published_mail(self).deliver
    end
  end
end
