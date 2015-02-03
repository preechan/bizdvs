class CreateContractorsLargestPublicWorksProjects < ActiveRecord::Migration
  def change
    create_table :contractors_largest_public_works_projects do |t|
      t.integer :contractor_id
      t.integer :largest_public_works_projects_id

      t.timestamps
    end
  end
end
