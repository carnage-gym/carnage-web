module RoutinesHelper

    def is_not_present(routine, exercise_id)
        return !routine.exercises.exists?(:id => exercise_id)

    end
end
