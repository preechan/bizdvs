class ChangeBondingLimitAggForContractors < ActiveRecord::Migration
  def change
  	change_table :contractors do |c|
  		c.change :bondingLmtAgg, :integer
  	end
  end
end
