# coding: utf-8

puts "--> Tag:"
aux = []
aux << (Tag.find_by_name("Deportista") || Tag.create(:name => 'Deportista', :image_name => "deportista.jpg"))
aux << (Tag.find_by_name("Vegetariano") || Tag.create(:name => 'Vegetariano', :image_name => "vegetariano.jpg"))
aux << (Tag.find_by_name("Balanceado") || Tag.create(:name => 'Balanceado', :image_name => "balanceado.jpg"))
aux << (Tag.find_by_name("Bajas Calorías") || Tag.create(:name => 'Bajas Calorías', :image_name => "bajas-calorias.jpg"))
aux.each { |x| puts x.name}
puts "\n"

puts "--> Measures:"
aux = []
aux << (Measure.find_by_name("Kilogramos") || Measure.create(:name => 'Kilogramos'))
aux << (Measure.find_by_name("Gramos") || Measure.create(:name => 'Gramos'))
aux << (Measure.find_by_name("Unidad") || Measure.create(:name => 'Unidad'))
aux << (Measure.find_by_name("Litros") || Measure.create(:name => 'Litros'))
aux.each { |x| puts x.name}
puts "\n"

puts "--> Measures:"
aux = []
aux << (Meal.find_by_name("Desayuno") || Meal.create(:name => 'Desayuno'))
aux << (Meal.find_by_name("Almuerzo") || Meal.create(:name => 'Almuerzo'))
aux << (Meal.find_by_name("Comida") || Meal.create(:name => 'Comida'))
aux.each { |x| puts x.name}
puts "\n"

puts "--> Ingredients:"
aux = []
aux << (Ingredient.find_by_name("Naranja") || Ingredient.create(:name => 'Naranja', :price => 1000, :quantity_for_price => 1))
aux << (Ingredient.find_by_name("Manzana") || Ingredient.create(:name => 'Manzana', :price => 1000, :quantity_for_price => 1))
aux << (Ingredient.find_by_name("Palta") || Ingredient.create(:name => 'Palta', :price => 1000, :quantity_for_price => 1))
aux << (Ingredient.find_by_name("Tomate") || Ingredient.create(:name => 'Tomate', :price => 1000, :quantity_for_price => 1))
aux << (Ingredient.find_by_name("Lechuga") || Ingredient.create(:name => 'Lechuga', :price => 1000, :quantity_for_price => 1))
aux << (Ingredient.find_by_name("Filete") || Ingredient.create(:name => 'Filete', :price => 1000, :quantity_for_price => 1))
aux << (Ingredient.find_by_name("Hamburguesa") || Ingredient.create(:name => 'Hamburguesa', :price => 1000, :quantity_for_price => 1))
aux << (Ingredient.find_by_name("Arroz") || Ingredient.create(:name => 'Arroz', :price => 1000, :quantity_for_price => 1))
aux.each { |x| puts x.name}
puts "\n"