class AddFaxToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :fax, :integer
  end
end
