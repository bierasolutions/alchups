require 'kml_path_extractor.rb'

namespace :municipal do
  desc "import municipal term"
  task :js_for_term => :environment do
    function = "function createTerm(map){\n"
    content = File.read("data/limitestermino.kml")
    extractor = KmlPathExtractor.new content
    termDefinition = ""
    extractor.coordinates_groups.each_with_index do |group, index|
      function << "createTermPath(termGroup#{index}, map);\n"
      termDefinition << "var termGroup#{index} = ["
      coordinates = []
      group.each do |coordinate|
        coordinates << "{lat: #{coordinate.latitude}, lng: #{coordinate.longitude}}"
      end
      termDefinition << coordinates.join(',')
      termDefinition << "];\n"
    end
    function << "}"
    puts termDefinition
    puts function
  end
end