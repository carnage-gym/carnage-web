class ExerciseSetsController < ApplicationController
  def destroy
    @set = ExerciseSet.find(params[:id])
    id = @set.workout_id

    respond_to do |format|
      format.html { redirect_to edit_workout_path(id) }
      format.turbo_stream 
    end

    @set.destroy
  end


  def edit
    @index = params[:index]
    @set = ExerciseSet.find(params[:id])
  end

  def update
    @set = ExerciseSet.find(params[:set_id])

    if @set.update(exercise_sets_params)
      render @set
    end
  end
  
  def create
    exercise = Exercise.find(params[:exercise_id])
    @exercise_id = params[:exercise_id] 

    @set = exercise.exercise_sets.new(workout_id: params[:workout_id], 
      intensity: 1, weight: 0, reps: 0)

    
    if @set.save
      respond_to do |format|
        format.html { redirect_to edit_workout_path(@set.workout_id) }
        format.turbo_stream
      end
    end
  end

  def exercise_sets_params
    params.require(:exercise_set).permit(:intensity, :weight, :reps)
  end

  
end
