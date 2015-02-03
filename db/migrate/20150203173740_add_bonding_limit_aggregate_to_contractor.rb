class AddBondingLimitAggregateToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :bondingLmtAgg, :decimal
  end
end
