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

ActiveRecord::Schema.define(version: 20170103164610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "couples", force: :cascade do |t|
    t.string   "nombre1"
    t.string   "nombre2"
    t.string   "contacto"
    t.string   "email"
    t.string   "telefono"
    t.string   "comoseenteraron"
    t.string   "descuento"
    t.string   "comentarios"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "nombre"
    t.string   "estilo"
    t.string   "edades"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.date     "fecha"
    t.string   "titulo"
    t.text     "notas"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "video"
    t.string   "bloggable_type"
    t.integer  "bloggable_id"
    t.string   "pago"
    t.index ["bloggable_type", "bloggable_id"], name: "index_lessons_on_bloggable_type_and_bloggable_id", using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "special_classes", force: :cascade do |t|
    t.string   "nombre1"
    t.string   "nombre2"
    t.string   "nombre3"
    t.string   "nombre4"
    t.string   "nombre5"
    t.string   "nombre6"
    t.string   "contacto"
    t.string   "email"
    t.string   "telefono"
    t.string   "comoseenteraron"
    t.string   "descuento"
    t.string   "comentarios"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "email"
    t.string   "comoseenteraron"
    t.string   "descuento"
    t.string   "comentarios"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "weddings", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "nombre1"
    t.string   "nombre2"
    t.date     "fecha_matri"
    t.string   "celular",         limit: 15
    t.string   "mail"
    t.string   "origen"
    t.string   "url_vals"
    t.text     "comentarios"
    t.string   "nombre_contacto"
    t.string   "telefono_novio"
    t.string   "telefono_novia"
    t.string   "email_novio"
    t.string   "email_novia"
    t.string   "tipo_descuento"
    t.string   "floordesign"
    t.string   "rut_novia"
    t.string   "rut_novio"
    t.string   "instagram_novia"
    t.text     "maspersonas"
  end

end
