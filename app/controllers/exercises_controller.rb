class ExercisesController < ApplicationController
  before_action :authenticate_user!, :find, only: [:edit, :update, :destroy]


  def find
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    return unless @exercise.save

    redirect_to '/'
  end

  def exercise_params
    params.require(:exercise).permit(:name, :emphasis, :description, :exerciseType, muscle_group_ids: [])
  end

  def index
    @exercises = Exercise.all
  end

  def edit; end

  def update
    return unless @exercise.update(exercise_params)

    redirect_to exercises_path
  end

  def destroy
    id = @exercise.id
    return unless @exercise.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: '/') }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("edit_exercise_#{id}") }
    end
  end
end
