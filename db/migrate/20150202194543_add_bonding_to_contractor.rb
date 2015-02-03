class AddBondingToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :bonding, :boolean
  end
end
