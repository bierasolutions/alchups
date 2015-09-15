require 'kml_path_extractor.rb'

namespace :route do
  desc "import routes path"
  task :js_for_paths => :environment do
    function = "function createRoutes(map){\n"

    ["1", "2"].each do |route_number|
      content = File.read("data/ruta#{route_number}.kml")
      extractor = KmlPathExtractor.new content
      route_definition =""
      route_function = "function createRoute#{route_number}(map){\n"
      extractor.coordinates_groups.each_with_index do |group, index|
        route_function << "createRoute#{route_number}Path(route#{route_number}Group#{index}, map);\n"
        route_definition << "var route#{route_number}Group#{index} = ["
        coordinates = []
        group.each do |coordinate|
          coordinates << "{lat: #{coordinate.latitude}, lng: #{coordinate.longitude}}"
        end
        route_definition << coordinates.join(',')
        route_definition << "];\n"
      end
      route_function << "}\n"
      function << "createRoute#{route_number}(map);\n"
      puts route_definition
      puts route_function
    end

    function << "}"
    puts function
  end
end