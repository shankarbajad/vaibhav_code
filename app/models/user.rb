class User < ActiveRecord::Base
  SKILLS = ["Management","Business","TBD","Sales","Marketing","TBD","Communication","Microsoft Office","Customer Service","Training","Microsoft Excel","Project Management","Designs","Analysis","Research","Websites","Budgets","Organization","Leadership","Time Management","Project Planning","Computer Program","Strategic Planning","Business Services","Applications","Reports","Microsoft Word","Program Management","Powerpoint","Negotation","Software","Networking","Offices","TBD","English","Data","TBD","Education","Events","International","Testing","Writing","Vendors","Advertising","Databases","Technology","TBD","Finance","Retail","accounting","social media","Teaching","Engineering","Performance Tuning","Problem Solving","Marketing Strategy","Materials","Recruiting","Order Fulfillment","Corporate Law","Photoshop","TBD","New business development","Human resources","Public speaking","Manufacturing","Internal Audit","strategy","Employees","Cost","Business Development","Windows","TBD","Public Relations","Product Development","Auditing","Business Strategy","Presentations","Construction","Real Estate","Editing","Sales Management","Team Building","Healthcare","TBD","Revenue","Compliance","Legal","Innovation","Policy","Mentoring","Commercial Real Estate","Consulting","Information Technology","Process Improvement","Change management","Heavy Equipment","Teamwork","Promotions","Facilities Management"]
  mount_uploader :avatar, AvatarUploader

  # validates :phone_number, :numericality => {:only_integer => true}

  mount_uploader :background_image, PhotoUploader
  crop_uploaded :background_image

  enum role: [:Founders, :Management, :Advisor, :Investor, :admin, :user]
  after_initialize :set_default_role, :if => :new_record?

  has_many :updates, as: :updateable, :dependent => :destroy
  accepts_nested_attributes_for :updates, allow_destroy: true, :reject_if => proc { |update| update['title'].blank? }


  has_many :terms, dependent: :destroy
  
  has_many :sign_documents, as: :documentable, :dependent => :destroy
  accepts_nested_attributes_for :sign_documents, reject_if: :all_blank, allow_destroy: true

  has_many :questionnaires, dependent: :destroy
  has_many :user_documents, :dependent => :destroy
  accepts_nested_attributes_for :user_documents, reject_if: :all_blank, allow_destroy: true

  has_many :user_photos, :dependent => :destroy
  accepts_nested_attributes_for :user_photos, reject_if: :all_blank, allow_destroy: true

  has_many :past_investments, :dependent => :destroy
  accepts_nested_attributes_for :past_investments, reject_if: :all_blank, allow_destroy: true

  has_many :highlights, :dependent => :destroy
  accepts_nested_attributes_for :highlights, reject_if: :all_blank, allow_destroy: true

  has_many :educations, :dependent => :destroy
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true

  has_many :user_videos, :dependent => :destroy
  accepts_nested_attributes_for :user_videos, allow_destroy: true, :reject_if => Proc.new { |user_video| user_video['link'].blank?  }

  after_commit :send_welcome_email, :on => :create


  def set_default_role
    self.role ||= :user 
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def self.find_for_linkedin_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.find_by_email(data["email"])
    else
      user = User.new(email: data["email"], :name => data["name"], :location => data["location"])
      user.remote_avatar_url = data["image"]
      user.password = SecureRandom.base64(5)
      user.password_confirmation = user.password
      user.bio = data["headline"]
      user.brief_description = data["description"]
      user.phone_number = data["phone"]
      user.linkedin_url = data.urls.public_profile rescue nil
      # user.industry = data["industry"]
      # user.location = data["location"]
      user.save(:validate => false)
    end
    return user
  end

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

end
