class ContractorsPublicWorksExp < ActiveRecord::Base
	belongs_to :contractor
	belongs_to :public_works_exp
end
