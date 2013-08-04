# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130804001938) do

  create_table "ingredient_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ingredient_images", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "ingredient_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.integer  "measure_id"
    t.float    "price"
    t.float    "quantity_for_price"
    t.text     "description"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "slug"
    t.integer  "ingredient_category_id"
  end

  add_index "ingredients", ["slug"], :name => "index_ingredients_on_slug", :unique => true

  create_table "ingredients_user_preferences", :id => false, :force => true do |t|
    t.integer "user_preference_id"
    t.integer "ingredient_id"
  end

  create_table "meals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "meals_recipes", :id => false, :force => true do |t|
    t.integer "meal_id"
    t.integer "recipe_id"
  end

  create_table "meals_user_preferences", :id => false, :force => true do |t|
    t.integer "meal_id"
    t.integer "user_preference_id"
  end

  create_table "measures", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.string   "short_name"
  end

  add_index "measures", ["slug"], :name => "index_measures_on_slug", :unique => true

  create_table "menus", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "shopping_list"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
    t.integer  "number_of_persons"
  end

  create_table "menus_recipes", :id => false, :force => true do |t|
    t.integer "recipe_id"
    t.integer "menu_id"
  end

  create_table "privacy_levels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "recipe_dificulties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "recipe_images", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "recipe_id"
  end

  create_table "recipe_ingredient_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipe_ingredients", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.float    "quantity"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "measure_id"
    t.integer  "recipe_ingredient_type_id"
  end

  create_table "recipe_steps", :force => true do |t|
    t.integer  "position"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "recipe_id"
  end

  create_table "recipe_user_added_ingredients", :force => true do |t|
    t.float    "quantity"
    t.integer  "measure_id"
    t.integer  "user_added_ingredient_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "recipe_id"
    t.string   "name"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "slug"
    t.integer  "dificulty"
    t.text     "dificulty_reason"
    t.integer  "cooking_time"
    t.integer  "privacy_level_id"
    t.integer  "recipe_dificulty_id"
    t.integer  "user_id"
    t.integer  "people"
    t.integer  "preparation_time"
    t.text     "introduction"
  end

  add_index "recipes", ["slug"], :name => "index_recipes_on_slug", :unique => true

  create_table "recipes_shopping_lists", :id => false, :force => true do |t|
    t.integer "recipe_id"
    t.integer "shopping_list_id"
  end

  create_table "recipes_tags", :id => false, :force => true do |t|
    t.integer "recipe_id"
    t.integer "tag_id"
  end

  create_table "shopping_list_items", :force => true do |t|
    t.integer  "ingredient_id"
    t.integer  "measure_id"
    t.float    "quantity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "shopping_list_id"
  end

  create_table "shopping_lists", :force => true do |t|
    t.integer  "status_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "image_name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "tags", ["slug"], :name => "index_tags_on_slug", :unique => true

  create_table "tags_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "tag_id"
  end

  create_table "user_added_ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_preferences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "day_to_send_email"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "week_time_span"
    t.integer  "people"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "role_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
