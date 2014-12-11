class CreateContractorsTrades < ActiveRecord::Migration
  def change
    create_table :contractors_trades do |t|
      t.integer :contractor_id
      t.integer :trade_id

      t.timestamps
    end
  end
end
