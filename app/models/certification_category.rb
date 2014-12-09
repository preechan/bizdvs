class CertificationCategory < ActiveRecord::Base
	belongs_to :contractor

	require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      certificationCategory_hash = row.to_hash # exclude the price field
      certificationCategory = CertificationCategory.where(id: certificationCategory_hash["id"])

      if certificationCategory.count == 1
        certificationCategory.first.update_attributes(certificationCategory_hash)
      else
        CertificationCategory.create!(certificationCategory_hash)
      end # end if !certificationCategory.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
