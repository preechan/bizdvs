class ChangeBondingLimitForContractors < ActiveRecord::Migration
  def change
  	change_table :contractors do |c|
  		c.change :bondingLmtSngProj, :integer
  	end
  end
end
