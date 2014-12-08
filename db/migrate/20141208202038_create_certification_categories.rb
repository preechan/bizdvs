class CreateCertificationCategories < ActiveRecord::Migration
  def change
    create_table :certification_categories do |t|
      t.string :certificationCategory
      t.string :microDiscount

      t.timestamps
    end
  end
end
