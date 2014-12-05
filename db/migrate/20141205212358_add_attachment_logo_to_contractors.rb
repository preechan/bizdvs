class AddAttachmentLogoToContractors < ActiveRecord::Migration
  def self.up
    change_table :contractors do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :contractors, :logo
  end
end
