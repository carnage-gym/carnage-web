class AddExerciseToExerciseSet < ActiveRecord::Migration[8.0]
  def change
    add_reference :exercise_sets, :exercise, null: false, foreign_key: true
  end
end
