class ExerciseSetsController < ApplicationController
  before_action :set_exercise_set, only: %i[update destroy]

  # GET /exercise_sets/new
  def new
    @exercise_set = ExerciseSet.new
  end

  # POST /exercise_sets or /exercise_sets.json
  def create
    @exercise_set = ExerciseSet.new(exercise_set_params)

    respond_to do |format|
      if @exercise_set.save
        format.html { redirect_to @exercise_set, notice: "Exercise set was successfully created." }
        format.json { render :show, status: :created, location: @exercise_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_sets/1 or /exercise_sets/1.json
  def update
    respond_to do |format|
      if @exercise_set.update(exercise_set_params)
        format.html { redirect_to @exercise_set, notice: "Exercise set was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_sets/1 or /exercise_sets/1.json
  def destroy
    @exercise_set.destroy!
    routine = Routine.find(params[:routine_id])

    respond_to do |format|
      format.html { redirect_to edit_routine_path(routine), status: :see_other, notice: "Exercise set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exercise_set
    @exercise_set = ExerciseSet.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def exercise_set_params
    params.expect(exercise_set: [:weight, :reps, :rir])
  end
end
