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

ActiveRecord::Schema.define(version: 2019_08_19_184652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acesso_usuario_fazendas", force: :cascade do |t|
    t.bigint "usuarios_id"
    t.bigint "fazendas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fazendas_id"], name: "index_acesso_usuario_fazendas_on_fazendas_id"
    t.index ["usuarios_id"], name: "index_acesso_usuario_fazendas_on_usuarios_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "nome"
    t.bigint "fazendas_id"
    t.bigint "tipo_solos_id"
    t.bigint "local_fisicos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fazendas_id"], name: "index_areas_on_fazendas_id"
    t.index ["local_fisicos_id"], name: "index_areas_on_local_fisicos_id"
    t.index ["tipo_solos_id"], name: "index_areas_on_tipo_solos_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cultivos", force: :cascade do |t|
    t.string "nome"
    t.bigint "tipo_cultivos_id"
    t.bigint "fazendas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fazendas_id"], name: "index_cultivos_on_fazendas_id"
    t.index ["tipo_cultivos_id"], name: "index_cultivos_on_tipo_cultivos_id"
  end

  create_table "fazenda_has_planos", force: :cascade do |t|
    t.date "dt_inicio"
    t.bigint "fazendas_id"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fazendas_id"], name: "index_fazenda_has_planos_on_fazendas_id"
  end

  create_table "fazendas", force: :cascade do |t|
    t.string "nome"
    t.string "rua"
    t.string "numero"
    t.integer "cep"
    t.string "estado"
    t.string "cidade"
    t.bigint "pessoas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoas_id"], name: "index_fazendas_on_pessoas_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.bigint "cargos_id"
    t.bigint "usuarios_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargos_id"], name: "index_funcionarios_on_cargos_id"
    t.index ["usuarios_id"], name: "index_funcionarios_on_usuarios_id"
  end

  create_table "local_fisicos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.bigint "fazendas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fazendas_id"], name: "index_local_fisicos_on_fazendas_id"
  end

  create_table "pes_pessoas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoa_fisicas", force: :cascade do |t|
    t.string "cpf"
    t.bigint "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_pessoa_fisicas_on_pessoa_id"
  end

  create_table "pessoa_juridicas", force: :cascade do |t|
    t.string "cnpj"
    t.bigint "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_pessoa_juridicas_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planos", force: :cascade do |t|
    t.string "nome"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plantios", force: :cascade do |t|
    t.date "dt_inicial"
    t.date "dt_final"
    t.bigint "areas_id"
    t.bigint "fazendas_id"
    t.bigint "cultivos_id"
    t.bigint "status_plantios_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["areas_id"], name: "index_plantios_on_areas_id"
    t.index ["cultivos_id"], name: "index_plantios_on_cultivos_id"
    t.index ["fazendas_id"], name: "index_plantios_on_fazendas_id"
    t.index ["status_plantios_id"], name: "index_plantios_on_status_plantios_id"
  end

  create_table "status_plantios", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_cultivos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_movimentacaos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_solos", force: :cascade do |t|
    t.string "nome"
    t.float "acidez"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email"
    t.string "senha"
    t.bigint "pessoa_fisicas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_fisicas_id"], name: "index_usuarios_on_pessoa_fisicas_id"
  end

  add_foreign_key "acesso_usuario_fazendas", "fazendas", column: "fazendas_id"
  add_foreign_key "acesso_usuario_fazendas", "usuarios", column: "usuarios_id"
  add_foreign_key "areas", "fazendas", column: "fazendas_id"
  add_foreign_key "areas", "local_fisicos", column: "local_fisicos_id"
  add_foreign_key "areas", "tipo_solos", column: "tipo_solos_id"
  add_foreign_key "cultivos", "fazendas", column: "fazendas_id"
  add_foreign_key "cultivos", "tipo_cultivos", column: "tipo_cultivos_id"
  add_foreign_key "fazenda_has_planos", "fazendas", column: "fazendas_id"
  add_foreign_key "fazendas", "pessoas", column: "pessoas_id"
  add_foreign_key "funcionarios", "cargos", column: "cargos_id"
  add_foreign_key "funcionarios", "usuarios", column: "usuarios_id"
  add_foreign_key "local_fisicos", "fazendas", column: "fazendas_id"
  add_foreign_key "pessoa_fisicas", "pessoas"
  add_foreign_key "pessoa_juridicas", "pessoas"
  add_foreign_key "plantios", "areas", column: "areas_id"
  add_foreign_key "plantios", "cultivos", column: "cultivos_id"
  add_foreign_key "plantios", "fazendas", column: "fazendas_id"
  add_foreign_key "plantios", "status_plantios", column: "status_plantios_id"
  add_foreign_key "usuarios", "pessoa_fisicas", column: "pessoa_fisicas_id"
end
