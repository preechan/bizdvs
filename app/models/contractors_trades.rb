class ContractorsTrades < ActiveRecord::Base
	belongs_to :contractor
	belongs_to :trade
end
