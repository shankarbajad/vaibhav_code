class Legal < ActiveRecord::Base
	belongs_to :company
	belongs_to :investment
end
