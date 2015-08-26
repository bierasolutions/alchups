require 'kml_path_extractor.rb'

namespace :route do
  desc "import routes path"
  task :js_for_paths => :environment do
    function = "function createRoutes(map){\n"

    ["1", "2"].each do |route_number|
      content = File.read("data/ruta#{route_number}.kml")
      extractor = KmlPathExtractor.new content
      routeDefinition =""
      extractor.coordinates_groups.each_with_index do |group, index|
        function << "createRoute#{route_number}Path(route#{route_number}Group#{index}, map);\n"
        routeDefinition << "var route#{route_number}Group#{index} = ["
        coordinates = []
        group.each do |coordinate|
          coordinates << "{lat: #{coordinate.latitude}, lng: #{coordinate.longitude}}"
        end
        routeDefinition << coordinates.join(',')
        routeDefinition << "];\n"
      end
      puts routeDefinition
    end

    function << "}"
    puts function
  end
end