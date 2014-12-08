class AddCertificationCategoryIdToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :certificationCategory_Id, :integer
  end
end
