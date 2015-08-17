class AddRouteIdToTanks < ActiveRecord::Migration
  def change
    add_column :tanks, :route_id, :integer
  end
end
