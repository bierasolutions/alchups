class Tank < ActiveRecord::Base
  validates :title, presence:true
  has_many :photos
  belongs_to :route

  def coordinates
  	Coordinates.utm_to_lat_long("WGS-84", self.y, self.x, "30N")
  end

  def latitude
    coordinates[:lat]
  end

  def longitude
    coordinates[:long]
  end

  def main_photo(size=:thumb)
    if(photos.size > 0)
      photos.first.image.url(size)
    end
  end
end
