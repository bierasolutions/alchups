
namespace :jekyll_pages do
  desc "Generate the alchups pages"
  task :generate => :environment do
    tanks = Tank.all
    tanks.each do |tank|
      serializable_photos = tank.photos.collect do |photo|
        {
          thumb: photo.image.url(:thumb),
          medium: photo.image.url(:medium),
          large: photo.image.url(:large)
        }
      end

      serializable_tanks = YAML.dump({
        layout: "alchup",
        id: tank.id,
        title: tank.title,
        description: tank.description,
        route: tank.route_id,
        latitude: tank.latitude.to_s,
        longitude: tank.longitude.to_s,
        main_photo: tank.main_photo(:large),
        main_photo_thumb: tank.main_photo(:thumb),
        photos: serializable_photos
      }.deep_stringify_keys) + "\n---"
      
      puts serializable_tanks
      File.open("_alchups/#{tank.id}.html", "w") { |f| f.write serializable_tanks  }

      routes = Route.all
      routes.each do |route|
        serializable_tanks = route.tanks.collect do |tank|
          {
            id: tank.id,
            title: tank.title,
            latitude: tank.latitude.to_s,
            longitude: tank.longitude.to_s,
            main_photo: tank.main_photo(:large),
            main_photo_thumb: tank.main_photo(:thumb),
          }
        end
        serializable_route = YAML.dump({
          layout: "route",
          id: route.id,
          title: route.title,
          alchups: serializable_tanks
        }.deep_stringify_keys) + "\n---"
        puts serializable_route
        File.open("_routes/#{route.id}.html", "w") { |f| f.write serializable_route  }
      end
    end
  end
end