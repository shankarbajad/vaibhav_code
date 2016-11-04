class TermSheet < ActiveRecord::Base
	belongs_to :investment
	
	SECURITY_DATA = ["Convertible Note", "equity options", "common stock", "preferred shares"]
	AUTOMIATIC_CONVERSION = ["Qualified Financing of $1,000,000+"]
end
