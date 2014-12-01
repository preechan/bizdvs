class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :name
      t.integer :licenseNo
      t.string :licenseClass
      t.string :bondingcapacity
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :phone
      t.string :email
      t.string :trade
      t.text :comments

      t.timestamps
    end
  end
end
