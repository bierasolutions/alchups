# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tank.create(title: "ALCHUP DE LA TORRE BASO", description: "Una descripcion", latitude: 41.8900475, longitude: 0.31794049999999996, notes: "TRANSFORMADO EN PISCINA AZUL")

30.times do |n|
  title  = Faker::Lorem.word.upcase
  description = Faker::Lorem.paragraph
  latitude = Faker::Number.decimal(2)
  longitude = Faker::Number.decimal(2)
  notes = Faker::Lorem.sentence
  Tank.create( title:  title,
               description: description,
               latitude: latitude,
               longitude: longitude,
               notes: notes)
end
