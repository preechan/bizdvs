class Contractor < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/small35.png"
	else
	 has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/small35.png",
	  :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :path => ":style/:id/:filename"
	end
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
