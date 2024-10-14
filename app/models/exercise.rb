class Exercise < ApplicationRecord
  TYPES = [
    WEIGHT_REPS = "Weight and reps",
    REPS = "Reps only",
    TIMED = "timed"
  ]


  def to_s = name

  has_many :exercise_sets, dependent: :destroy
  has_and_belongs_to_many :workouts
  has_and_belongs_to_many :routines
  has_and_belongs_to_many :muscle_groups
  belongs_to :user # Every single exercise was created by a user.

  validates :muscle_groups, :name, presence: true
  validates :exerciseType, inclusion: {in: TYPES}
end
