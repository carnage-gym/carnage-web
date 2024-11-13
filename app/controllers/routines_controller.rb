# frozen_string_literal: true

class RoutinesController < ApplicationController 
  before_action :set_routine, only: %i[show edit update destroy add_exercise remove_exercise]
  before_action :authenticate_user!

  # GET /routines or /routines.json
  def index
    @routines = current_user.routines.all
  end

  # GET /routines/1 or /routines/1.json
  def show; end

  # GET /routines/new
  def new
    @routine = current_user.routines.new
    @routine.save(name: 'my routine')

    redirect_to edit_routine_path(@routine)
  end

  # GET /routines/1/edit
  def edit; end

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to routines_path, notice: 'Routine was successfully updated.', notice: "Routine was successfully updated." }
        format.json { render :show, status: :ok, location: @routine }
        format.turbo_stream { redirect_to routines_path, notice: 'Routine was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1 or /routines/1.json
  def destroy
    @routine.destroy!

    respond_to do |format|
      format.html { redirect_to routines_path, status: :see_other, notice: 'Routine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_exercise
    exercise = Exercise.find(params[:exercise_id])
    exercise.exercise_sets.new(intensity: 1, routine_id: @routine.id, weight: 0, reps: 0)
    @routine.exercises << exercise

    if @routine.save
      respond_to do |format|
        format.html { redirect_to edit_routine_path(@routine), status: :success }
        format.turbo_stream { render turbo_stream: turbo_stream.append(:exercises,
                                                                       partial: 'exercises/exercise', locals: { exercise: })}
      end
    else
      redirect_to edit_routine_path(@routine, notice: "no.")
    end
  end

  def remove_exercise
    exercise = Exercise.find(params[:exercise_id])
    @routine.exercises.delete(exercise)

    if @routine.save
      respond_to do |format|
        # should NEVER happen
        format.html { redirect_to edit_routine_path(@routine), status: :success }
        format.turbo_stream { render turbo_stream: turbo_stream.remove("edit_exercise_#{exercise.id}") }
      end
    else
      redirect_to edit_routine_path(@routine, notice: 'no.')
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_routine
    @routine = Routine.find(params[:id] || params[:routine_id])
  end

  # Only allow a list of trusted parameters through.
  def routine_params
    params.require(:routine).permit(:name, :description,
                                    exercise_set_attributes: [:id, :exercise_id, :intensity, :workout_id, :weight, :reps])
  end
end
