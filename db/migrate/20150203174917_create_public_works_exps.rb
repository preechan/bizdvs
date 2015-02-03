class CreatePublicWorksExps < ActiveRecord::Migration
  def change
    create_table :public_works_exps do |t|
      t.string :name

      t.timestamps
    end
  end
end
