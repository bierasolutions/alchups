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
  def initialize(input)
    @coordinates = []
    coordinates_groups(input).each do |group|
      @coordinates += KmlPathExtractor.coordinates_from(group.content)
    end
  end

  def coordinates
    @coordinates
  end

  def self.coordinates_from(input)
    coordinates = []
    input.strip.split(" ").each do |part|
      coordinates << Coordinate.new(part)
    end
    coordinates
  end

  private
    def coordinates_groups input
      xml = Nokogiri::XML(input)
      xml.css("MultiGeometry coordinates")
    end
end