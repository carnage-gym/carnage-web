class WorkoutsController < ApplicationController
  before_action :authenticate_user!, :find, only: %i[destroy show edit update]
  def index
    @workouts = current_user.workouts
  end

  def destroy
    id = @workout.id

    # This is needed in order to circumvent errors.
    @workout.exercises.map { |e| e.exercise_sets.destroy_all }

    return unless @workout.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("workout_#{id}") }
      format.html { redirect_to logbook_path(id: params[:user_id]) }
    end
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    redirect_back(fallback_location: '/') if @workout.save
  end

  def show
    @exercises = Exercise.where(id: @workout.exercise_ids)
  end

  def edit
    @workout.exercises.each do |ex|
      ex.exercise_sets.build
    end

    not_found!('Not found') if current_user != @workout.user
  end

  def update
    return unless @workout.update(workout_params)

    # redirect_to workouts_path
    @exercises = params[:workout][:exercise_ids].map { |ex| Exercise.find(ex) }

    # exercise added
    respond_to do |format|
      format.html { redirect_to edit_workout_path(params[:id]) }
      format.turbo_stream
    end
  end

  def workout_params
    params.require(:workout).permit(:title, :duration, :description, exercise_ids: [])
  end

  def find
    return unless params[:id]

    @workout = Workout.find(params[:id])
  end

  def not_found!(msg)
    raise ActionController::RoutingError, msg
  end

  def remove_exercise
    @workout = Workout.find(params[:workout_id])
    exercise = Exercise.find(params[:exercise_id])

    exercise.exercise_sets.where(workout_id: @workout.id).destroy_all
    @workout.exercises.delete(exercise)

    return unless @workout.save

    respond_to do |format|
      format.html { redirect_back(fallback_location: '/') }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("edit_exercise_#{params[:exercise_id]}") }
    end
  end

  def add_exercise
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.find(params[:exercise_id])
    @workout.exercises.append(@exercise)

    return unless @workout.save

    respond_to do |format|
      format.html { redirect_back(fallback_location: '/') }
      format.turbo_stream do
        render turbo_stream: turbo_stream.append('exercises', partial: 'exercises/exercise',
                                                              locals: { exercise: @exercise, is_workout: true })
      end
    end
  end
end
