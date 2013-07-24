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
aux << (Meal.find_by_name("Plato Principal") || Meal.create(:name => 'Plato Principal'))
aux << (Meal.find_by_name("Acompañamiento") || Meal.create(:name => 'Acompañamiento'))
aux << (Meal.find_by_name("Ensalada") || Meal.create(:name => 'Ensalada'))
aux << (Meal.find_by_name("Aperitivo") || Meal.create(:name => 'Aperitivo'))
aux << (Meal.find_by_name("Entrada") || Meal.create(:name => 'Entrada'))
aux << (Meal.find_by_name("Postre") || Meal.create(:name => 'Postre'))
aux << (Meal.find_by_name("Tragos") || Meal.create(:name => 'Tragos'))
aux.each { |x| puts x.name}
puts "\n"

puts "--> PrivacyLevel:"
aux = []
aux << (PrivacyLevel.find_by_name("Privado") || PrivacyLevel.create(:name => 'Privado', :description => 'Solo visible para el usuario que crea la receta'))
aux << (PrivacyLevel.find_by_name("Público") || PrivacyLevel.create(:name => 'Público', :description => 'Visible para todos los usuarios'))
aux.each { |x| puts x.name}
puts "\n"

puts "--> RecipeDificulty:"
aux = []
aux << (RecipeDificulty.find_by_name("Fácil") || RecipeDificulty.create(:name => 'Fácil', :description => 'Todos lo pueden cocinar'))
aux << (RecipeDificulty.find_by_name("Medio") || RecipeDificulty.create(:name => 'Medio', :description => 'Personas con experiencia'))
aux << (RecipeDificulty.find_by_name("Difícil") || RecipeDificulty.create(:name => 'Difícil', :description => 'Para expertos'))
aux << (RecipeDificulty.find_by_name("Para Chefs") || RecipeDificulty.create(:name => 'Para Chefs', :description => 'Para personas con estudios de gastronomía'))
aux.each { |x| puts x.name}
puts "\n"

puts "--> RecipeIngredientType:"
aux = []
aux << (RecipeIngredientType.find_by_name("Principal") || RecipeIngredientType.create(:name => 'Principal'))
aux << (RecipeIngredientType.find_by_name("Secundario") || RecipeIngredientType.create(:name => 'Secundario'))
aux.each { |x| puts x.name}
puts "\n"

puts "--> IngredientCategory:"
aux = []
aux << (IngredientCategory.find_by_name("Vegetales") || IngredientCategory.create(:name => 'Vegetales'))
aux << (IngredientCategory.find_by_name("Carnes") || IngredientCategory.create(:name => 'Carnes'))
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