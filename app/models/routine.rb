class Routine < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :exercises, before_remove: :destroy_exercise_sets
  has_many :exercise_sets, dependent: :destroy

  def destroy_exercise_sets(exercise)
    exercise.exercise_sets.where(routine_id: id).destroy_all
  end

  validates :name, presence: true, length: {maximum: 16, too_long: "Name must not exceed %{count} characters."}
end
