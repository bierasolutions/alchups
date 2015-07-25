# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tank.create(title: "ALCHUP DE LA TORRE BASO", description: "Una descripcion", latitude: 4642975.716565, longitude: 775285.957988, notes: "TRANSFORMADO EN PISCINA AZUL")

30.times do |n|
  title  = Faker::Lorem.word.upcase
  description = Faker::Lorem.paragraph
  latitude = Faker::Number.between(4641000, 4649000)
  longitude = Faker::Number.between(772000, 779000)
  notes = Faker::Lorem.sentence
  Tank.create( title:  title,
               description: description,
               latitude: latitude,
               longitude: longitude,
               notes: notes)
end
