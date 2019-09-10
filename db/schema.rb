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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_10_220215) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.float "abv"
    t.integer "ibu"
    t.string "description"
    t.integer "brewery_id"
    t.integer "category_id"
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
    t.index ["category_id"], name: "index_beers_on_category_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.index ["beer_id"], name: "index_favorites_on_beer_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.integer "user_id"
    t.integer "beer_id"
    t.index ["beer_id"], name: "index_reviews_on_beer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
