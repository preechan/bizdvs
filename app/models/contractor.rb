class Contractor < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "profile26.png"
	else
	 has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "profile26.png",
	  :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :path => ":style/:id/:filename"
	end
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

has_many :certificationCategories , dependent: :destroy
 has_and_belongs_to_many  :trades
require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      contractor_hash = row.to_hash 
      contractor = Contractor.where(name:  contractor_hash["name"])

      if contractor.count == 1
        contractor.first.update_attributes(contractor_hash)
      else
        Contractor.create!(contractor_hash)
      end # end if !Contractor.nil?
    end # end CSV.foreach
  end # end self.import(file)


def self.as_csv
  CSV.generate do |csv|
    csv << column_names
    all.each do |item|
      csv << item.attributes.values_at(*column_names)
    end
  end
end

  def self.search(search)
      where('name LIKE ? OR address LIKE ? OR city LIKE ? OR zipcode LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
  end

end
