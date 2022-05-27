# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_26_230951) do
  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "todo_id", null: false
    t.index ["todo_id"], name: "index_photos_on_todo_id"
  end

  create_table "photos_tags", id: false, force: :cascade do |t|
    t.integer "photo_id", null: false
    t.integer "tag_id", null: false
    t.index ["photo_id", "tag_id"], name: "index_photos_tags_on_photo_id_and_tag_id"
    t.index ["tag_id", "photo_id"], name: "index_photos_tags_on_tag_id_and_photo_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "due_date"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "surname"
  end

  add_foreign_key "photos", "todos"
end
