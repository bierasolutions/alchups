require 'nokogiri'

class Coordinate
  def initialize(longitude_latitude)
    parts = longitude_latitude.split(',')
    @latitude = parts[1]
    @longitude = parts[0]
  end
  def latitude
    @latitude
  end
  def longitude
    @longitude
  end
end

class KmlPathExtractor
  @coordinates
  @coordinates_groups
  def initialize(input)
    @coordinates = []
    @coordinates_groups = []
    parse_coordinates(input)
  end

  def coordinates_groups
    @coordinates_groups
  end

  def coordinates
    @coordinates
  end

  def self.coordinates_from input
    coordinates = []
    input.strip.split(" ").each do |part|
      coordinates << Coordinate.new(part)
    end
    coordinates
  end

  private
    def parse_coordinates input
      xml = Nokogiri::XML(input)
      xml.css("Placemark coordinates").each do |group|
        coordinates = KmlPathExtractor.coordinates_from(group.content)
        @coordinates_groups << coordinates
        @coordinates += coordinates
      end
    end
end