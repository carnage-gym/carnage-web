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

ActiveRecord::Schema[7.1].define(version: 2024_02_16_122204) do
  create_table "Exercises_MuscleGroups", id: false, force: :cascade do |t|
    t.integer "MuscleGroup_id", null: false
    t.integer "Exercise_id", null: false
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workout_id", null: false
    t.integer "weight"
    t.integer "reps"
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_sets_on_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "emphasis"
    t.integer "type"
    t.string "exerciseType"
    t.integer "user_id", null: false
    t.integer "number_of_sets"
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "exercises_muscle_groups", id: false, force: :cascade do |t|
    t.integer "muscle_group_id", null: false
    t.integer "exercise_id", null: false
  end

  create_table "exercises_workouts", id: false, force: :cascade do |t|
    t.integer "workout_id", null: false
    t.integer "exercise_id", null: false
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performed_exercises", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "sets_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_performed_exercises_on_exercise_id"
    t.index ["sets_id"], name: "index_performed_exercises_on_sets_id"
  end

  create_table "performed_exercises_workouts", id: false, force: :cascade do |t|
    t.integer "workout_id", null: false
    t.integer "performed_exercise_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "duration"
    t.string "description"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercise_sets", "workouts"
  add_foreign_key "exercises", "users"
  add_foreign_key "performed_exercises", "exercises"
  add_foreign_key "performed_exercises", "sets", column: "sets_id"
  add_foreign_key "workouts", "users"
end
