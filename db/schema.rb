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

ActiveRecord::Schema.define(version: 2021_05_13_133429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "result_id", null: false
    t.bigint "question_id", null: false
    t.json "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["result_id"], name: "index_answers_on_result_id"
  end

  create_table "possible_answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.integer "position"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id", "position"], name: "index_possible_answers_on_question_id_and_position", unique: true
    t.index ["question_id"], name: "index_possible_answers_on_question_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_questionnaires_on_slug", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "step_id", null: false
    t.integer "position"
    t.string "value"
    t.integer "answer_type"
    t.boolean "answer_required", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["step_id", "position"], name: "index_questions_on_step_id_and_position", unique: true
    t.index ["step_id"], name: "index_questions_on_step_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "questionnaire_id", null: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questionnaire_id"], name: "index_results_on_questionnaire_id"
    t.index ["uid"], name: "index_results_on_uid"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "questionnaire_id", null: false
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questionnaire_id", "position"], name: "index_steps_on_questionnaire_id_and_position", unique: true
    t.index ["questionnaire_id"], name: "index_steps_on_questionnaire_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "results"
  add_foreign_key "possible_answers", "questions"
  add_foreign_key "questions", "steps"
  add_foreign_key "results", "questionnaires"
  add_foreign_key "steps", "questionnaires"
end
