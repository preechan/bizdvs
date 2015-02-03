class CreateLargestPublicWorksProjects < ActiveRecord::Migration
  def change
    create_table :largest_public_works_projects do |t|
      t.string :name

      t.timestamps
    end
  end
end
