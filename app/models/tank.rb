class Tank < ActiveRecord::Base
  validates :title, presence:true
  has_many :photos
  belongs_to :route

  def main_photo(size=:thumb)
    if(photos.size > 0)
      photos.first.image.url(size)
    end
  end
end
