module MuscleGroupsHelper
  def join_muscle_groups(exercise)
    return unless !exercise.muscle_groups.nil? # should never happen...

    names = exercise.muscle_groups.map { |e| e.name }
    names.join(", ")
  end
end
