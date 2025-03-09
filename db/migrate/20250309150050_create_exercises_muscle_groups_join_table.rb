class CreateExercisesMuscleGroupsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :muscle_groups, :exercises do |t|
      # t.index [:muscle_group_id, :exercise_id]
      # t.index [:exercise_id, :muscle_group_id]
    end
  end
end
