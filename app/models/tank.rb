class Tank < ActiveRecord::Base
  validates :title, presence:true
  has_many :photos
end
