class Trade < ActiveRecord::Base
	 has_and_belongs_to_many  :contractor
end
