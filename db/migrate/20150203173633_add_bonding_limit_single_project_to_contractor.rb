class AddBondingLimitSingleProjectToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :bondingLmtSngProj, :decimal
  end
end
