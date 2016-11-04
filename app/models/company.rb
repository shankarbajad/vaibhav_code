class Company < ActiveRecord::Base
	has_many :investments
  has_many :questionnaires, dependent: :destroy

  INDUSTRY = {
      "1" => "Airlines/Aviation",
"2" => "Alternative Dispute Resolution",
"3" => "Alternative Medicine",
"4" => "Animation",
"5" => "Apparel & Fashion",
"6" => "Architecture & Planning",
"7" => "Arts and Crafts",
"8" => "Automotive",
"9" => "viation & Aerospace",
"10" => "Banking",
"11" => "Biotechnology",
"12" => "Broadcast Media",
"13" => "Building Materials",
"14" => "Business Supplies and Equipment",
"15" => "Capital Markets",
"16" => "Chemicals",
"17" => "Civic & Social Organization",
"18" => "Civil Engineering",
"19" => "Commercial Real Estate",
"20" =>'Computer  & Network Security',
"21" => "Computer Games",
"22" => "Computer Hardware",
"23" => "Computer Networking",
"24" => "Computer Software",
"25" => "Construction",
"26" => "Consumer Electronics",
"27" => "Consumer Goods",
"28" => "Consumer Services",
"29" => "Cosmetics",
"30" => "Dairy",
"31" => "Defense & Space",
"32" => "Design",
"33" => "Education Management",
"34" => "E-Learning",
"35" => "Electrical/Electronic Manufacturing",
"36" => "Entertainment",
"37" => "Environmental Services",
"38" => "Events Services",
"39" => "Executive Office",
"40" => "Facilities Services",
"41" => "Financial Services",
"42" => "Fine Art",
"43" => "Fishery",
"44" => "Food & Beverages",
"45" => "Food Production",
"46" => "Fund-Raising",
"47" => "Furniture",
"48" => "Gambling & Casinos",
"49" => "Glass, Ceramics & Concrete",
"50" => "Government Administration",
"51" => "overnment Relations",
"52" => "Graphic Design",
"53" => "Health, Wellness and Fitness",
"54" => "Higher Education",
"55" => "Hospital & Health Care",
"56" => "Hospitality",
"57" => "Human Resources",
"58" => "Import and Export",
"59" => "Individual & Family Services",
"60" => "Industrial Automation",
"61" => "Information Services",
"62" =>"Information Technology and Services",
"63" =>"Insurance",
"64" =>"International Affairs",
"65" =>"International Trade and Development",
"66" =>"Internet",
"67" =>"Investment Banking",
"68" =>"Investment Management",
"69" =>"Judiciary",
"70" =>"Law Enforcement",
"71" =>"Law Practice",
"72" =>"Legal Services",
"73" =>"Legislative Office",
"74" =>"Leisure, Travel & Tourism",
"75" =>"Libraries",
"76" =>"Logistics and Supply Chain",
"77" =>"Luxury Goods & Jewelry",
"78" =>"Machinery",
"79" =>"Management Consulting",
"80" =>"Maritime",
"81" =>"Market Research",
"82" =>"Marketing and Advertising",
"83" =>"Mechanical or Industrial Engineering",
"84" =>"Media Production",
"85" =>"Medical Devices",
"86" =>"Medical Practice",
"87" =>"Mental Health Care",
"88" =>"Military",
"89" =>"Mining & Metals",
"90" =>"Motion Pictures and Film",
"91" =>"Museums and Institutions",
"92" =>"Music",
"93" =>"Nanotechnology",
"94" =>"Newspapers",
"95" =>"Non-Profit Organization Management",
"96" =>"Oil & Energy",
"97" =>"Online Media",
"98" =>"Outsourcing/Offshoring",
"99" =>"Package/Freight Delivery",
"100" =>"Packaging and Containers",
"101" =>"Paper & Forest Products",
"102" =>"Performing Arts",
"103" =>"Pharmaceuticals",
"104" =>"Philanthropy",
"105" =>"Photography",
"106" =>"Plastics",
"107" =>"Political Organization",
"108" =>"Primary/Secondary Education",
"109" =>"Printing",
"110" =>"Professional Training & Coaching",
"111" =>"Program Development",
"112" =>"Public Relations and Communications",
"113" =>"Public Safety",
"114" =>"Publishing",
"115" =>"Railroad Manufacture",
"116" =>"Ranching",
"117" =>"Real Estate",
"118" =>"Recreational Facilities and Services",
"119" =>"Religious Institutions",
"120" =>"Renewables & Environment",
"121" =>"Research",
"122" =>"Restaurants",
"123" =>"Retail",
"124" =>"Security and Investigations",
"125" =>"Semiconductors",
"126" =>"Shipbuilding",
"127" =>"Sports",
"128" =>"Staffing and Recruiting",
"129" =>"Supermarkets",
"130" =>"Telecommunications",
"131" =>"Textiles",
"132" =>"Think Tanks",
"133" =>"Tobacco",
"134" =>"Translation and Localization",
"135" =>"Transportation/Trucking/Railroad",
"136" =>"Utilities",
"137" =>"Venture Capital & Private Equity",
"138" =>"Veterinary",
"139" =>"Warehousing",
"140" =>"Wholesale",
"141" =>"Wine and Spirits",
"142" =>"Wireless",
"143" =>"Writing and Editing"
  }


  has_many :company_documents, :dependent => :destroy
  accepts_nested_attributes_for :company_documents, reject_if: :all_blank, allow_destroy: true

  has_many :sign_documents, as: :documentable, :dependent => :destroy
  accepts_nested_attributes_for :sign_documents, reject_if: :all_blank, allow_destroy: true

  has_many :company_photos, :dependent => :destroy
  accepts_nested_attributes_for :company_photos, reject_if: :all_blank, allow_destroy: true

  has_many :videos, :dependent => :destroy
  accepts_nested_attributes_for :videos, reject_if: :all_blank, allow_destroy: true
  belongs_to :user, foreign_key: :creator_id
  has_many :users, :class_name => "User", :through => :staffs, :source => :user
  has_many :staffs, :dependent => :destroy

  has_many :updates, as: :updateable, :dependent => :destroy
  accepts_nested_attributes_for :updates, allow_destroy: true, :reject_if => proc { |update| update['title'].blank? }

    attr_accessor :background_image_crop_x, :background_image_crop_y, :background_image_crop_w, :background_image_crop_h

  mount_uploader :logo, PhotoUploader
  mount_uploader :background_image, PhotoUploader
  crop_uploaded :background_image

  default_scope { order("name ASC") }

  after_create :send_company_created_email

  # validates_format_of :company_website, :with => URI::regexp(%w(http https))
  # validates_format_of :linkedin, :with => ( /(ftp|http|https):\/\/?(?:www\.)?linkedin.com(\w+:{0,1}\w*@)?(\S+)(:([0-9])+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/)
  # validates_format_of :facebook, :with => (/(https?:\/\/)?((w{3}\.)?)facebook.com\/.*/i) 
  # validates_format_of :twitter, :with => (/http(?:s)?:\/\/(?:www\.)?twitter\.com\/([a-zA-Z0-9_]+)/) 

  

  def staffs_with_role(role)
    self.users.send(role.to_sym)
  end

  private
  def send_company_created_email
    CompanyMailer.company_created_mail(self).deliver
  end

end

