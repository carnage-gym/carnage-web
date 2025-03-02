class ChangeExerciseSetsId < ActiveRecord::Migration[8.0]
  def change
    change_column_null :routines, :exercise_sets_id, true
  end
end
