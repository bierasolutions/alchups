require 'csv'

namespace :tanks do
  desc "task import alchups data"
  task :import => :environment do
    CSV.foreach("data/alchups.csv", :headers => true) do |row|
      Tank.create!(
        :title => row[1].split.map(&:capitalize).join(' '),
        :notes => row[4],
        :x => row[7],
        :y => row[8]
      )
    end
  end

  desc "transform X/Y coordinates to lat/long format"
  task :transform_to_lat_long => [:environment] do
    Tank.all.each do |tank|
      coordinates = Coordinates.utm_to_lat_long("WGS-84", tank.y, tank.x, "30N")
      tank.latitude = coordinates[:lat]
      tank.longitude = coordinates[:long]
      tank.save!
    end
  end
end

