class Route < ActiveRecord::Base
  has_many :tanks
  def to_s
    title
  end
end
