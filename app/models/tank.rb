class Tank < ActiveRecord::Base
  validates :title, presence:true
end
