# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_28_123354) do

  create_table "feedback_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "reply_post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reply_post_id", "created_at"], name: "index_feedback_posts_on_reply_post_id_and_created_at"
    t.index ["reply_post_id"], name: "index_feedback_posts_on_reply_post_id"
    t.index ["user_id", "created_at"], name: "index_feedback_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_feedback_posts_on_user_id"
  end

  create_table "reply_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "subject_post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_post_id", "created_at"], name: "index_reply_posts_on_subject_post_id_and_created_at"
    t.index ["subject_post_id"], name: "index_reply_posts_on_subject_post_id"
    t.index ["user_id", "created_at"], name: "index_reply_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_reply_posts_on_user_id"
  end

  create_table "subject_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "img"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_subject_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_subject_posts_on_user_id"
  end

  create_table "tagmaps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "subject_post_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_post_id"], name: "index_tagmaps_on_subject_post_id"
    t.index ["tag_id"], name: "index_tagmaps_on_tag_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_name"], name: "index_tags_on_tag_name", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "feedback_posts", "reply_posts"
  add_foreign_key "feedback_posts", "users"
  add_foreign_key "reply_posts", "subject_posts"
  add_foreign_key "reply_posts", "users"
  add_foreign_key "subject_posts", "users"
  add_foreign_key "tagmaps", "subject_posts"
  add_foreign_key "tagmaps", "tags"
end
