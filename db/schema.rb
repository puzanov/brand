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

ActiveRecord::Schema.define(:version => 20110803122120) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "brief"
    t.string   "content"
    t.string   "image"
    t.string   "article_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price_file_name"
    t.string   "price_content_type"
    t.integer  "price_file_size"
    t.datetime "price_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "name"
    t.string   "role"
    t.string   "userpic"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
