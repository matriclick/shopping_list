# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "--> Dress Types:"
aux = []
aux << (Tag.find_by_name("Deportista") || Tag.create(:name => 'Deportista', :image_name => "deportista.jpg"))
aux << (Tag.find_by_name("Vegetariano") || Tag.create(:name => 'Vegetariano', :image_name => "vegetariano.jpg"))
aux << (Tag.find_by_name("Balanceado") || Tag.create(:name => 'Balanceado', :image_name => "balanceado.jpg"))
aux << (Tag.find_by_name("Bajas Calorías") || Tag.create(:name => 'Bajas Calorías', :image_name => "bajas-calorias.jpg"))
aux.each { |x| puts x.name}
puts "\n"