class CertificationCategory < ActiveRecord::Base
	belongs_to :contractor

	require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      certificationCategory_hash = row.to_hash 
      certificationCategory = CertificationCategory.joins(:contractor).where('contractors.name' => certificationCategory_hash["contractor_name"],:certificationCategory => certificationCategory_hash["certificationCategory"])
      contractor = Contractor.where(name:  certificationCategory_hash["contractor_name"]).first!
      certificationCategory_hash.delete("contractor_name")
  	 	certificationCategory_hash[:contractor_id] = contractor.id
      if certificationCategory.count == 1
        certificationCategory.first.update_attributes(certificationCategory_hash)
      else
        CertificationCategory.create!(certificationCategory_hash)
      end # end if !certificationCategory.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
