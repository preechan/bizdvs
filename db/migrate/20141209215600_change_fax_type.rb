class ChangeFaxType < ActiveRecord::Migration
  def change
  	 change_column :contractors, :fax, :string
  end
end
