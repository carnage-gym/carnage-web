class RoutinesController < ApplicationController
  before_action :set_routine, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /routines or /routines.json
  def index
    @routines = current_user.routines.all
  end

  # GET /routines/1 or /routines/1.json
  def show
  end

  # GET /routines/new
  def new
    @routine = current_user.routines.new
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines or /routines.json
  def create
    @routine = current_user.routines.new(routine_params)

    respond_to do |format|
      if @routine.save
        format.html { redirect_to @routine, notice: "Routine was successfully created." }
        format.json { render :show, status: :created, location: @routine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to @routine, notice: "Routine was successfully updated." }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def routine_params
      params.require(:routine).permit(:name, :description, exercise_set_attributes: [:id, :exercise_id, :intensity, :workout_id, :weight, :reps])
    end
end
