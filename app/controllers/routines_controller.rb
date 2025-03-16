class RoutinesController < ApplicationController
  before_action :set_routine, only: %i[show edit update destroy]

  # GET /routines or /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/1 or /routines/1.json
  def show
  end

  # GET /routines/new
  def new
    # TODO: if a routine called "new routine" already exists, it's impossible to create new ones.
    # fix that.
    @routine = current_user.routines.new(name: "New Routine")
    @routine.save!
    redirect_to edit_routine_path(@routine.id)
  end

  # GET /routines/1/edit
  def edit
    # the exercises that can be added to a routine. prevents duplicates.
    @addable_exercises = Exercise.all.select { |ex| !ex.in? @routine.exercises }
  end

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to routines_path, notice: "Routine was successfully updated." }
        format.json { render :show, status: :ok, location: @routine }
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
      format.html { redirect_to routines_path, status: :see_other, notice: "Routine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PATCH /routines/1/addExercise/1
  def add_exercise
    @routine = Routine.find(params[:routine_id])
    @exercise = Exercise.find(params[:exercise_id])

    @routine.exercises.push(@exercise)

    # also creates one exercise set.
    @exercise.exercise_sets.create!(rir: 9, weight: 1, reps: 1, routine_id: @routine.id)

    respond_to do |format|
      format.html { redirect_to edit_routine_path(@routine) }
      format.turbo_stream
    end
  end

  def remove_exercise
    @routine = Routine.find(params[:routine_id])
    @exercise = Exercise.find(params[:exercise_id])

    @routine.exercises.delete(@exercise)

    respond_to do |format|
      format.html { redirect_to edit_routine_path(@routine) }
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_routine
    @routine = Routine.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def routine_params
    params.expect(routine: [:name, exercise_ids: []])
  end
end
