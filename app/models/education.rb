class Education < ActiveRecord::Base
	belongs_to :user

	LEVEL = {
        "1" => "Undergraduate",
		"2" => "Graduate",
		"3" => "Phd",
	}
end


