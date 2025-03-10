class ExerciseSet < ApplicationRecord
  belongs_to :exercise

  validates :weight, :reps, presence: true  # rir can be blank, for stuff like warmup sets
  validates :weight, :reps, :rir, numericality: {greater_than: 0}
  validates_numericality_of :rir, {in: (0..10)}
end
