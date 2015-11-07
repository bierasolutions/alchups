class AddLatitudeAndLongitudeToTanks < ActiveRecord::Migration
  def change
    add_column :tanks, :latitude, :decimal
    add_column :tanks, :longitude, :decimal
  end
end
