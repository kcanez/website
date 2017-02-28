class Beer < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many:reviews
	
	has_attached_file :beer_image, :styles => { :beer_index => "300x575^", :beer_show => "300x575^" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :beer_image, :content_type => /\Aimage\/.*\Z/
end
