require 'kml_path_extractor.rb'

RSpec.describe "Kml path extraction" do
  describe "parse an input that contains coordinates in longitude,latitude format" do
    let(:coordinate) { Coordinate.new("0.33692001882686834,41.892632226936385") }
    it "the latitude is ok" do
      expect(coordinate.latitude).to eq '41.892632226936385'
    end
    it "the longitude is ok" do
      expect(coordinate.longitude).to eq '0.33692001882686834'
    end
  end

  describe "parse an input with a couple of coordinates separated by spaces" do
    let(:input) { "0.33692001882686834,41.892632226936385 0.33676664235891096,41.892751962001874 0.33659240968876436,41.892823514087695" }
    it "have the corresponding number of coordinates" do
      coordinates = KmlPathExtractor.coordinates_from input
      expect(coordinates.size).to eq 3
    end
  end

  describe "parse an kml format file" do
    let(:content) { File.read('spec/utils/for_testing.kml') }
    it "should detect the groups of coordinates inside <MultiGeometry>" do
      path_extractor = KmlPathExtractor.new content
      expect(path_extractor.coordinates_groups.size).to eq 7
    end

    it "should detect the coordinates inside <MultiGeometry> tag" do
      path_extractor = KmlPathExtractor.new content
      expect(path_extractor.coordinates.size).to eq 115
    end
  end
  
end