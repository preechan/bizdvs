class RemoveCertificationCategoryIdFromContractors < ActiveRecord::Migration
  def change
    remove_column :contractors, :certificationCategory_Id, :integer
  end
end
