class Tank < ActiveRecord::Base
  validates :title, presence:true
  has_many :photos

  def coordinates
  	Coordinates.utm_to_lat_long("WGS-84", self.latitude, self.longitude, "30N")
  end
end
