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

ActiveRecord::Schema.define(:version => 20121006155102) do

  create_table "bathroom_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bathrooms", :force => true do |t|
    t.boolean  "isHandicapAccessible"
    t.boolean  "isPublic"
    t.boolean  "isFamily"
    t.boolean  "isGreen"
    t.boolean  "isUnisex"
    t.boolean  "isHandsFree"
    t.boolean  "hasProductDispenser"
    t.boolean  "hasAttendent"
    t.boolean  "hasSignage"
    t.boolean  "hasWifi"
    t.integer  "venue_id"
    t.integer  "BathroomType_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "bathrooms", ["BathroomType_id"], :name => "index_bathrooms_on_BathroomType_id"
  add_index "bathrooms", ["venue_id"], :name => "index_bathrooms_on_venue_id"

  create_table "reviews", :force => true do |t|
    t.text     "reviewText"
    t.integer  "bathroom_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reviews", ["bathroom_id"], :name => "index_reviews_on_bathroom_id"

  create_table "score_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "value"
    t.integer  "bathroom_id"
    t.integer  "ScoreType_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "scores", ["ScoreType_id"], :name => "index_scores_on_ScoreType_id"
  add_index "scores", ["bathroom_id"], :name => "index_scores_on_bathroom_id"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
