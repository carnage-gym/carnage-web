class CreateExerciseSets < ActiveRecord::Migration[8.0]
  def change
    create_table :exercise_sets do |t|
      t.integer :weight
      t.integer :reps
      t.decimal :rir

      t.timestamps
    end
  end
end
