class ChangeExercisesRoutineId < ActiveRecord::Migration[8.0]
  def change
    change_column_null :exercises, :routine_id, true
  end
end
