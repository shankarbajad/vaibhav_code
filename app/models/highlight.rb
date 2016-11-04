class Highlight < ActiveRecord::Base
	belongs_to :user

	TYPE = {
        "1" => "professional",
		"2" => "accomplishment",
		"3" => "investor",
		"4" => "personal"
	}

end