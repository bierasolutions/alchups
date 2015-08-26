require 'kml_path_extractor.rb'

namespace :route do
  desc "import routes path"
  task :js_for_paths => :environment do
    ["1", "2"].each do |route_number|
      content = File.read("data/ruta#{route_number}.kml")
      extractor = KmlPathExtractor.new content
      code =""
      extractor.coordinates_groups.each_with_index do |group, index|
        code << "var route#{route_number}Coordinates#{index} = ["
        coordinates = []
        group.each do |coordinate|
          coordinates << "{lat: #{coordinate.latitude}, lng: #{coordinate.longitude}}"
        end
        code << coordinates.join(',')
        code << "];\n"
      end
      puts code
    end
  end
end