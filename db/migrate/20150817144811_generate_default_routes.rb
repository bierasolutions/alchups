class GenerateDefaultRoutes < ActiveRecord::Migration
  def up
    route_titles = ["De los lavaderos a las Forcas", "De Perera a la Heredad"]
    route_titles.each do |title|
      Route.create :title => title
    end
  end
  def down
    Route.delete_all
  end
end
