class AddOtherDetailsToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :certificationType, :string
    add_column :contractors, :ownershipType, :string
    add_column :contractors, :sfCertificationNumber, :integer
    add_column :contractors, :sfVendorNumber, :integer
    add_column :contractors, :firmSize, :integer
  end
end
