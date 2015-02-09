class AddDocumentToContractor < ActiveRecord::Migration
  def change
    add_attachment :contractors, :document
  end
end
