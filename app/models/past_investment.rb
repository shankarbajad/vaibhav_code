class PastInvestment < ActiveRecord::Base
	belongs_to :user
	belongs_to :by_user, class_name: "User", foreign_key: :created_by

	PRODUCT = {
        "1" => "Convertible",
		"2" => "Debt",
		"3" => "Equity",
		"4" => "Micro-Finance",
		"5" => "Other"
	}

	STAGE = {
        "1" => "Angel",
		"2" => "Growth Equity",
		"3" => "Mezzanine Debt",
		"4" => "Private Equity",
		"5" => "Seed",
		"6" => "Series A",
		"7" => "Series B",
		"8" => "Series C or Later Venture Capital",	
		"9" => "Venture Debt"
	}
end