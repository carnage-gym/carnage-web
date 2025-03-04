class AddRoutineToExercise < ActiveRecord::Migration[8.0]
  def change
    add_reference :exercises, :routine, null: false, foreign_key: true
  end
end
