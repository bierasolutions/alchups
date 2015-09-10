class ChangeLatitudeAndLongitudeToYAndX < ActiveRecord::Migration
  def change
    rename_column(:tanks, :latitude, :y)
    rename_column(:tanks, :longitude, :x)
  end
end
