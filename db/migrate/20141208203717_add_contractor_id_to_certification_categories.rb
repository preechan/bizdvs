class AddContractorIdToCertificationCategories < ActiveRecord::Migration
  def change
    add_column :certification_categories, :contractor_id, :integer
  end
end
