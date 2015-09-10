class Photo < ActiveRecord::Base
  belongs_to :tank
  has_attached_file :image, :styles => { :medium => "415x230#", :thumb => "115x85#", :large => "1350x750#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
