class ChangeExercisesId < ActiveRecord::Migration[8.0]
  def change
    change_column_null :routines, :exercises_id, true
  end
end
