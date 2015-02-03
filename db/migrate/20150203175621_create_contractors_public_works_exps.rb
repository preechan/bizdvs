class CreateContractorsPublicWorksExps < ActiveRecord::Migration
  def change
    create_table :contractors_public_works_exps do |t|
      t.integer :contractor_id
      t.integer :public_works_exp_id

      t.timestamps
    end
  end
end
